package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import javax.servlet.http.HttpServletRequest
import org.hibernate.FetchMode
class CustomCollectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    ConfigObject holder = ConfigurationHolder.getConfig();
    def real = holder.getProperty("upload")

	def books(){
        render "books"
    }
    
    def results(){
        def user = session.user.attach()
        def entries
        if (params.tag){
            String cri = params.tag
            cri = "%"+cri+"%"
            entries = Product.createCriteria().list{

                and {

                    eq('user', user)
                    //    between('created', new Date()-1, new Date())
                    //  tags {
                    //    eq('name', 'Grails')
                }
                and{
                    like('title',cri)
                }
                //  maxResults(3)
                order("id", "asc")

            }


        }
        [arr: entries]
    }


    def put(){

        if(params.id && params.deleted){

            def user = session.user.attach()
            def pros = user.product
            def productList = []

            for (x in pros){
                productList.add(x.attach())

            }
            def added = []
            def single
            def addc
            
            if (params.deleted instanceof String[]){
              //   log.info "multiple adding"

                for (z in params.deleted){

                    for(x in productList){

                        if(String.valueOf(x.id).equals(z)){
                            added.add(x.attach())
                           // log.info("guess wat")
                            break

                        }
                    }
                }

                
            }else{

                for(x in productList){

                    if(String.valueOf(x.id).equals(params.deleted)){
                        single = x.attach()
                        break
                    }
                } 
            }
          
             
            def cos = user.collection
            def coslist = []

            for (x in cos){
                coslist.add(x.attach())

            }

            for(x in coslist){
                if(String.valueOf(x.id).equals(params.id)){
                    addc = x.attach()
                    break
                }

            }
          // log.info "Array is ${added}"
            if (single){

               // log.info "single addition"
                if (addc.parent){

                    for(x in coslist){
                        if(addc.parent.id == x.id){
                            def parent = x.attach()
                            single.addToCollection(parent)
                            break
                        }

                    }
                }

                single.addToCollection(addc)
                single.save()
            }else{

                for (a in added){
                    //log.info "Adding....."
                    if (addc.parent){

                        for(x in coslist){
                          //  log.info "Adding parent"
                            if(addc.parent.id == x.id){
                                def parent = x.attach()
                                a.addToCollection(parent)
                               // break
                            }

                        }
                    }
                  //  log.info "Adding multiple products from ${a} to ${addc}"
                    a.addToCollection(addc)
                    a.save()
                }
            }


            //added.addtoCollection(addc)

            user.save()
          /*
            added.addToCollection(addc)
            //added.addtoCollection(addc)
            added.save()
            user.save()

            /*
             def pro = Product.get(params.coll)
             long x = Long.parseLong(params.id)
             def collection = CustomCollection.get(x)
             pro.addToCollection(collection)
             pro.save(flush: true)
             */
            flash.message = "Added in Collection "

           redirect(action: "showp",id: params.id)

        }else{
            render "nothing"

        }
        render "${params}"
    }
    
    
    def custom(){
		
		if(params.coll){
			
			def user = session.user.attach()
			def pros = user.product
            def productList = []

            for (x in pros){
                productList.add(x.attach())

            }
			def added
			def addc
			for(x in productList){
					if(String.valueOf(x.id).equals(params.coll)){
					added = x.attach()
					break
					}
				}
			
			def cos = user.collection
			def coslist = []

            for (x in cos){
                coslist.add(x.attach())

            }

			for(x in coslist){
				if(String.valueOf(x.id).equals(params.id)){
				addc = x.attach()
				break
				}
						
			}
            
            if (addc.parent){

                for(x in coslist){
                    if(addc.parent.id == x.id){
                        def parent = x.attach()
                        added.addToCollection(parent)
                        break
                    }

                }
            }

			added.addToCollection(addc)
			//added.addtoCollection(addc)
			added.save()
			user.save()
			
		 /*		
		  def pro = Product.get(params.coll)
		  long x = Long.parseLong(params.id)
		  def collection = CustomCollection.get(x)
	      pro.addToCollection(collection)
		  pro.save(flush: true)
		  */
		 flash.message = "Added in Collection "

		  redirect(action: "showp",id: params.id)
			
			}else{
			render "nothing"
			
			}
		
		}

    def remove(){
       def user = session.user.attach()

        if (params.coll && params.id){
            def delete

            for (x in user.collection){
                if (x.id == Long.parseLong(params.id))     {
                    delete = x.attach()
                    break
                }  
            }

            for(x in user.product){
                if (x.id == Long.parseLong(params.coll))     {
                   def del = x.attach()
                   del.collection.remove(delete)
                  //  log.info user.save(flush: true)
                   break
                }
            }
        }

    flash.message ="Removed"
    redirect(action:"showp",id: params.id)
    }

	def showc(){
		//params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def host = request.getServerName()
		def user = session.user.attach()
		//def pros =user.product
		//session['pros'] = pros
		def c = user.collection
        def clist = []
        for (x in c){
            if (x.parent )  {
               continue
            } else{
                clist.add(x.attach())
            }


           // log.info(x.root)
        }
        
       // log.info(child)
		[customCollectionInstanceList: clist,host:host]
		
		}
	
	def showp(){
		def tobe = params.id
		def user = session.user.attach()
		//def arr = user.collection
		def cname
		/*for(x in arr){
			if(String.valueOf(x.id).equals(tobe))
			cname = x.name
			}*/
        def names = user.collection
        for (x in names){
            if (x.id == (Long.parseLong(params.id)))
                 {
                cname = x.attach()
                     break
                 }
        }

        def entries = CustomCollection.createCriteria().list (){

            and {

                eq('parent', cname)
                //    between('created', new Date()-1, new Date())
                //  tags {
                //    eq('name', 'Grails')
            }
            //  maxResults(3)
            order("id", "asc")

        }
        // log.info(entries)
		//cname = CustomCollection.get(Long.parseLong(params.id))
        def producTlist = []

		def cx = user.product

        for (x in cx){
            producTlist.add(x.attach())

        }
		def status = []
			for(p in producTlist)
				{
					def cl = p.collection
					for(x in cl)
						{
							
							if(String.valueOf(x.id).equals(tobe))
							status.add(p)
							
						}
					
				}

        def var
        def pg
        def by
        def ord
        if (params.page){
            var = params.page
        }else{
            var = 0
        }

        if (params.by){
            by = params.by
        }
        if (params.ord){
            ord = params.ord
        }

        def entries1 = Product.createCriteria().list (max: 4, offset: var){

            and {

                eq('user', user)
                //    between('created', new Date()-1, new Date())
                //  tags {
                //    eq('name', 'Grails')
            }
            //  maxResults(3)
            if (params.by && params.ord) {
                order(by,ord)
            }
            else{

                if (params.by)
                    order(by,'asc')
                else  {
                    if (params.ord)
                        order('id',ord)
                    else
                        order('id','asc')
                }

            }


        }



		[my:status,demo:cname,all:cx,img:cname.image,entries:entries,arr:entries1]
		}
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [customCollectionInstanceList: CustomCollection.list(params), customCollectionInstanceTotal: CustomCollection.count()]
    }

    def create() {
        [customCollectionInstance: new CustomCollection(params)]
    }


    def createc() {
        [customCollectionInstance: new CustomCollection(params)]
    }

    def savec() {

        def user = session.user.attach()
        def his = user.userId

        def imgname = "col_${his}_${params.name.toString().replaceAll("\\s","_")}.png"
        def dir = real + imgname
        def mhsr = request.getFile('image')

        if (!mhsr?.empty && mhsr.size) {
            mhsr.transferTo(
                    new File(
                            dir
                    )
            )
        }

        dir =  imgname
        def parent = CustomCollection.get(params.id)
       // log.info("Parents is going to be.............................. "+ params.id)
        def customCollectionInstance = new CustomCollection(name:params.name, description:params.description,image:dir);
        customCollectionInstance.parent = parent
        customCollectionInstance.root = false
        user.addToCollection(customCollectionInstance)
        if (!customCollectionInstance.save(flush: true)) {

            render(view: "showp", model: [customCollectionInstance: customCollectionInstance
                    ,id:customCollectionInstance.id,name:customCollectionInstance.name])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'customCollection.label', default: 'CustomCollection'), customCollectionInstance.id])
        redirect(action: "showp", id: customCollectionInstance.id,model: [customCollectionInstance: customCollectionInstance
                ,id:customCollectionInstance.id])
    }

    def save() {
		
		def user = session.user.attach()
		def his = user.userId
		
		def imgname = "col_${his}_${params.name.toString().replaceAll("\\s","_")}.png"
		def dir = real + imgname
		def mhsr = request.getFile('image')
		
		if (!mhsr?.empty && mhsr.size) {
			mhsr.transferTo(
			new File(
			dir
			)
			)
			}
			
		dir = imgname
		
        def customCollectionInstance = new CustomCollection(name:params.name, description:params.description,image:dir);
		user.addToCollection(customCollectionInstance)
        if (!customCollectionInstance.save(flush: true)) {
			
            render(view: "showp", model: [customCollectionInstance: customCollectionInstance
				,id:customCollectionInstance.id,name:customCollectionInstance.name])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'customCollection.label', default: 'CustomCollection'), customCollectionInstance.id])
        redirect(action: "showp", id: customCollectionInstance.id,model: [customCollectionInstance: customCollectionInstance
				,id:customCollectionInstance.id])
    }
    
    
    
    
    
    def change(){
        def user = session.user.attach()

        if (user){

            def his = user.userId
            def collection = CustomCollection.get(params.id)
            def dir
            boolean img = false

            if (params.image){

                def imgname = "col_${his}_${params.name.toString().replaceAll("\\s","_")}.png"
                dir = real + imgname
                def mhsr = request.getFile('image')

                if (!mhsr?.empty && mhsr.size) {
                    mhsr.transferTo(
                            new File(
                                    dir
                            )
                    )
                }

                dir =  imgname
                img = true
            }

            if (img){
                collection.image = dir
                collection.name = params.name
                collection.description = params.description
            }else{
                collection.name = params.name
                collection.description = params.description
            }
           user.save(flush: true)
        }

        flash.message ="Changes Saved"
        redirect(action:"showp",id: params.id)
    }

    def show() {
        def customCollectionInstance = CustomCollection.get(params.id)
        if (!customCollectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customCollection.label', default: 'CustomCollection'), params.id])
            redirect(action: "list")
            return
        }

        [customCollectionInstance: customCollectionInstance]
    }

    def edit() {
        def tobe = params.id
        def user = session.user.attach()
        //def arr = user.collection
        def cname

        def names = user.collection
        for (x in names){
            if (x.id == (Long.parseLong(params.id)))
            {
                cname = x.attach()
                break
            }
        }

        def entries = CustomCollection.createCriteria().list (){

            and {

                eq('parent', cname)
                //    between('created', new Date()-1, new Date())
                //  tags {
                //    eq('name', 'Grails')
            }
            //  maxResults(3)
            order("id", "asc")

        }

        [demo:cname,img:cname.image,entries:entries]
    }

    def update() {
        def customCollectionInstance = CustomCollection.get(params.id)
        if (!customCollectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customCollection.label', default: 'CustomCollection'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (customCollectionInstance.version > version) {
                customCollectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customCollection.label', default: 'CustomCollection')] as Object[],
                          "Another user has updated this CustomCollection while you were editing")
                render(view: "edit", model: [customCollectionInstance: customCollectionInstance])
                return
            }
        }

        customCollectionInstance.properties = params

        if (!customCollectionInstance.save(flush: true)) {
            render(view: "edit", model: [customCollectionInstance: customCollectionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'customCollection.label', default: 'CustomCollection'), customCollectionInstance.id])
        redirect(action: "show", id: customCollectionInstance.id)
    }

    def delete() {
        def customCollectionInstance = CustomCollection.get(params.id)
        if (!customCollectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customCollection.label', default: 'CustomCollection'), params.id])
            redirect(action: "list")
            return
        }

        try {
            customCollectionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'customCollection.label', default: 'CustomCollection'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customCollection.label', default: 'CustomCollection'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    public static  Object getChild(CustomCollection parent){

           def child =  CustomCollection.createCriteria().list (){

                and {
                    eq('parent', parent);
                }

                order("id", "asc")  ;

        }

        return child
}

public static String hasChild(CustomCollection parent){

    def child =  CustomCollection.createCriteria().list (){

        and {
            eq('parent', parent);
        }

        order("id", "asc")  ;

    }

    if (child != null && child.size()>0)
        return 'true'
    else
        return 'false'

}
   static String str
public static String makeList(CustomCollection parent,String request){


    str = '<ul>'
    
    def child =  CustomCollection.createCriteria().list (){

        and {
            eq('parent', parent);
        }

        order("id", "asc")

        fetchMode('collection',FetchMode.JOIN)

    }
    
    for (x in child){

        str += '<li>'

        if (hasChild(x)=='true'){
            str=str+ '<a href ="'+request+'/customCollection/showp/'+x.id+'">' +x.name+"</a>"
            println(x.class)
           str+=makeList(x,request)
        }else{
           str=str+'<a href ="'+request+'/customCollection/showp/'+x.id+'">' +x.name+"</a>"
        }
        
        str += '</li>'
    }
    
    str+='</ul>'
    println()
    println(str)
    return str
}


    def ajaxDelete = {

        def user = session.user.attach()
        def arr = user.collection
        def del
        def my =[]
        for (x in arr){
            if (x.id == Long.parseLong(params.id))     {
                del = x.attach()
                
                break
            }

        }

        def parent = null
        boolean hasParent = false

        if (del && del.parent){
         //   log.info "has parents"

            for (x in arr){
                if (x.id == del.parent.id)     {
                    parent = x.attach()
                    hasParent = true
                  //  log.info "parents ${parent.name}"
                    break
                }

            }
        }

       boolean red = true
        if (hasChild(del) == 'true'){

            flash.message = "${del.name} has children, please delete them first"
            red = false
            redirect(action: "showp",id: del.id)
            
        }else{

            if (parent)  {
                parent.collection.remove(del)
             //   log.info("parent was ${parent}")
            }


            user.collection.remove(del)
            del.delete(flush:true)
            user.save()
            flash.message = "${del.name} deleted"
        }

       // log.info("the deleted object shall be"+del)
        
        if (red)
        redirect(action: "showc")

    }
    
}