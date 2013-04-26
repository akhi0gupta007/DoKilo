package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException
import com.codebee.SiteAdmin
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import com.codebee.Profile
import com.codebee.products.CustomCollection
import com.codebee.products.Vendor
import com.codebee.products.Product

class TemplatesController {

    ConfigObject holder = ConfigurationHolder.getConfig();
    def real = holder.getProperty("logo")

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
   def site() {
        def admin = SiteAdmin.get(1)
        def templates = admin.templates
         [templates:templates]
   }
    def index() {
        redirect(action: "list", params: params)
    }

    def store(){
        def store
        def user = session.user.attach()
        if (user.profile)
        store = user.profile.template
        
        [store:store]
    }
    def my(){

        def user = session.user.attach()
        def themes = user.templates
        def set
        def tset =[]

        for (x in themes)  {
            tset.add(x.attach())
        }
        if (user.profile)
        set = user.profile.template
        else
        set = ""

        [themes:tset,set:set]

    }
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [templatesInstanceList: Templates.list(params), templatesInstanceTotal: Templates.count()]
    }

    def create() {
        [templatesInstance: new Templates(params)]
    }

    def save() {
        def templatesInstance = new Templates(params)
        if (!templatesInstance.save(flush: true)) {
            render(view: "create", model: [templatesInstance: templatesInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'templates.label', default: 'Templates'), templatesInstance.id])
        redirect(action: "show", id: templatesInstance.id)
    }

    def show() {
        def templatesInstance = Templates.get(params.id)
        if (!templatesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'templates.label', default: 'Templates'), params.id])
            redirect(action: "list")
            return
        }

        [templatesInstance: templatesInstance]
    }

    def editme(){
        def user = session.user.attach()
        def context = request.getContextPath()
        def collection = user.collection
                [collection:collection,context:context]

    }
    def editVendors(){
        def user = session.user.attach()
        def vendor = user.vendor
        [collection:vendor]
    }
    def edit() {
        def templatesInstance = Templates.get(params.id)
        if (!templatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templates.label', default: 'Templates'), params.id])
            redirect(action: "list")
            return
        }

        [templatesInstance: templatesInstance]
    }

    def update() {
        def templatesInstance = Templates.get(params.id)
        if (!templatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'templates.label', default: 'Templates'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (templatesInstance.version > version) {
                templatesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'templates.label', default: 'Templates')] as Object[],
                          "Another user has updated this Templates while you were editing")
                render(view: "edit", model: [templatesInstance: templatesInstance])
                return
            }
        }

        templatesInstance.properties = params

        if (!templatesInstance.save(flush: true)) {
            render(view: "edit", model: [templatesInstance: templatesInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'templates.label', default: 'Templates'), templatesInstance.id])
        redirect(action: "show", id: templatesInstance.id)
    }

    def delete() {
        def templatesInstance = Templates.get(params.id)
        if (!templatesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'templates.label', default: 'Templates'), params.id])
            redirect(action: "list")
            return
        }

        try {
            templatesInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'templates.label', default: 'Templates'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'templates.label', default: 'Templates'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def saveProfile(){
        def user = session.user.attach()
        def his = user.userId
        def template
        def dir
        def theme
        def  css
        def profile
        boolean status = false
        if (params.name){
            
            if (params.theme){
                 theme = Templates.get(params.theme)
                 css = theme.css
            }
            if (params.image){

                def imgname = "logo_${his}_${params.name}.png"
                 dir = real + imgname
                def mhsr = request.getFile('image')

                if (!mhsr?.empty && mhsr.size) {
                    mhsr.transferTo(
                            new File(
                                    dir
                            )
                    )
                }

                dir = imgname

            }
             if (dir)
                 template = new Templates(name: params.name,logo: dir,storeName: params.store,css: css)
            else
                 template = new Templates(name: params.name,storeName: params.store,css: css)
            
            if (template){

                template.save(flush: true)
                user.addToTemplates(template)
                if (user.profile) {
                    profile = user.profile
                    profile.template = template
                }
                else{
                    profile = new Profile(template: template)
                    user.profile = profile
                }

                 user.save(flush: true)
                 status = true

                 
            }
        }
        if (status){
            flash.message = "Store Profile : ${template.name},Saved for your sales"
        }else{
            flash.message = "Error Could Not Be saved"
        }

        redirect(action: "site")
          //  render "${css} and ${profile.validate()}"
    }

    def now(){
        def user = session.user.attach()
        def template = Templates.get(params.theme)

        if (user.profile){
            def profile = user.profile
            profile.template = template
            user.save(flush: true)
        }

        flash.message = "Store Profile : ${template.name},Saved for your sales"
        redirect(action: "my")
    }

    def accept(){

        def user = session.user.attach()
        def arr = user.collection
        HashSet list  = arr

        for (x in arr){
            list.add(x.attach())
        }

        def hide = []
        HashSet show  = new HashSet()
        if (params.sel){

            if (params.sel instanceof String[]){
               for (x in params.sel){

                      show.add(CustomCollection.get(x))
                      log.info "${x} "
                  
               }
               for (x in list){
                   
                    if (there(show,x)){
                        log.info "got it ${x.name}"
                        x.showColl = true
                    }  else{
                        x.showColl = false
                        hide.add(x)
                    }
               }
                
            } else {
                
                def exception = CustomCollection.get(params.sel)
                for (x in list){
                    
                     if (exception.id == x.id)
                     {
                         x.showColl = true
                     }
                     else  {
                         x.showColl = false
                         hide.add(x)
                     }

                }
            }
        }
        if (hide)
        flash.message = "${hide.name} are hidden now"
        else
        flash.message = "Saved"
        user.save(flush: true)
        redirect(action: "editme")
    }


    def acceptVendor(){

        def user = session.user.attach()
        def arr = user.vendor
        HashSet list  = arr

        for (x in arr){
            list.add(x.attach())
        }

        def hide = []
        HashSet show  = new HashSet()
        if (params.sel){

            if (params.sel instanceof String[]){
                for (x in params.sel){

                    show.add(Vendor.get(x))
                    log.info "${x} "

                }
                for (x in list){

                    if (there(show,x)){
                      //  log.info "got it ${x.name}"
                        x.showColl = true
                    }  else{
                        x.showColl = false
                        hide.add(x)
                    }
                }

            } else {

                def exception = Vendor.get(params.sel)
                for (x in list){

                    if (exception.id == x.id)
                    {
                        x.showColl = true
                    }
                    else  {
                        x.showColl = false
                        hide.add(x)
                    }

                }
            }
        }
        if (hide)
            flash.message = "${hide.ven_name} are hidden now"
        else
            flash.message = "Saved"
        user.save(flush: true)
        redirect(action: "editVendors")
    }

    def acceptProducts(){

        def user = session.user.attach()
        def arr = user.product
        HashSet list  = arr

        for (x in arr){
            list.add(x.attach())
        }

        def hide = []
        HashSet show  = new HashSet()
        if (params.sel){

            if (params.sel instanceof String[]){
                for (x in params.sel){

                    show.add(Product.get(x))
                    log.info "${x} "

                }
                for (x in list){

                    if (there(show,x)){
                        log.info "got it ${x.title}"
                        x.showPro = true
                    }  else{
                        x.showPro = false
                        hide.add(x)
                    }
                }

            } else {

                def exception = Product.get(params.sel)
                for (x in list){

                    if (exception.id == x.id)
                    {
                        x.showPro = true
                    }
                    else  {
                        x.showPro = false
                        hide.add(x)
                    }

                }
            }
        }
        if (hide)
            flash.message = "${hide.title} are hidden now"
        else
            flash.message = "Saved"
        user.save(flush: true)
        redirect(action: "editProducts")
       // render "${params}"
    }

    def editProducts(){
        def user = session.user.attach()
        def vendor = user.product
        [collection:vendor]

    }

    public static boolean there(Set set,Object obj){
        for (x in set){
            if (x.id == obj.id){
                return true

            }
        }
        return false
    }
}
