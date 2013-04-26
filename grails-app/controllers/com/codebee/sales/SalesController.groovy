package com.codebee.sales

import org.springframework.dao.DataIntegrityViolationException
import com.codebee.themes.Templates
import com.codebee.User
import com.codebee.SiteAdmin
import com.codebee.products.CustomCollection
import org.hibernate.FetchMode
import com.codebee.products.Product
import grails.converters.JSON

class SalesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]



	def select(){

	def user = session.user.attach()
	def choosed = Templates.list()
	def id = user.id
	def y
	
	for(x in choosed){
		if(x.id == Long.parseLong(params.themes))     {
            y = x
            y.enable = true
            y.save()
            if (session["temp"])
                session["temp"] = y
        }  else{
            x.enable = false
            x.save()
        }

		}

      /*
        for(x in choosed){
            if(x.id == y.id)  {
               continue
            }
            else{
                y.enable = false
                y.save()
            }
        }
            */
   	flash.message = "Template Saved for Site."
	redirect(action: "pref")
	}
	
	 def store() {
         def clist = []
         def temp
         def storeName
         def products
         def featured
        if (session.user){
            
            def user = session.user.attach()

            if (user.featured){
              featured = user.featured.product
            }
            products = user.product
            if (user && user.profile){
                temp = user.profile.template
                if (temp.storeName)
                 storeName = temp.storeName
                else
                    storeName = user.userId


                def c = user.collection

                for (x in c){
                    if (x.parent )  {
                        continue
                    } else{
                        clist.add(x.attach())
                    }


                 //   log.info(x.root)
                }

            }else{
                flash.message = "No Store Profile Created"
                redirect(controller:'templates', action: 'site')
            }
        } else{
            flash.message = "No Store Profile Created"
            redirect(controller:'templates', action: 'site')
        }


        [products:products,temp:temp,storeName:storeName,featured:featured,customCollectionInstanceList: clist]
		}

    def blog(){
        def clist = []
        def temp
        def storeName
        def blog

        if (session.user){
            def user = session.user.attach()

            if (user && user.profile){

                blog = user.blog

                temp = user.profile.template
                if (temp.storeName)
                    storeName = temp.storeName
                else
                    storeName = user.userId

                def c = user.collection

                for (x in c){
                    if (x.parent )  {
                        continue
                    } else{
                        clist.add(x.attach())
                    }


                    //   log.info(x.root)
                }

            }else{
                flash.message = "No Store Profile Created"
                redirect(controller:'templates', action: 'site')
            }

        }  else{
            flash.message = "Invalid URL"
            redirect(controller:'persistence', action: 'invalid')
        }
        [temp:temp,storeName:storeName,customCollectionInstanceList: clist,blog:blog]
    }



    def about(){
        def clist = []
        def temp
        def storeName
        def about

        if (session.user){
            def user = session.user.attach()

            if (user && user.profile){

                about = user.aboutUs

                temp = user.profile.template
                if (temp.storeName)
                    storeName = temp.storeName
                else
                    storeName = user.userId

                def c = user.collection

                for (x in c){
                    if (x.parent )  {
                        continue
                    } else{
                        clist.add(x.attach())
                    }


                    //   log.info(x.root)
                }

            }else{
                flash.message = "No Store Profile Created"
                redirect(controller:'templates', action: 'site')
            }

        }  else{
            flash.message = "Invalid URL"
            redirect(controller:'persistence', action: 'invalid')
        }
        [temp:temp,storeName:storeName,customCollectionInstanceList: clist,blog:about]
    }

    def category(){

        def clist = []
        def temp
        def storeName
        def products
        def featured
        if (session.user && params.id){

            def user = session.user.attach()

            if (user && user.profile){
                temp = user.profile.template
                if (temp.storeName)
                    storeName = temp.storeName
                else
                    storeName = user.userId

                def collection = CustomCollection.get(params.id)
                
                if (collection){
                products = collection.product
                }

                def c = user.collection

                for (x in c){
                    if (x.parent )  {
                        continue
                    } else{
                        clist.add(x.attach())
                    }


                 //   log.info(x.root)
                }

            }else{
                flash.message = "No Store Profile Created"
                redirect(controller:'templates', action: 'site')
            }
        } else{
            flash.message = "Invalid URL"
            redirect(controller:'persistence', action: 'invalid')
        }


        [products:products,temp:temp,storeName:storeName,featured:featured,customCollectionInstanceList: clist]
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
                str=str+ '<a href ="'+request+'/sales/category/'+x.id+'">' +x.name+"</a>"
              //  println(x.class)
                str+=makeList(x,request)
            }else{
                str=str+'<a href ="'+request+'/sales/category/'+x.id+'">' +x.name+"</a>"
            }

            str += '</li>'
        }

        str+='</ul>'
        println()
     //   println(str)
        return str
    }


    def pref(){
		
		def user = session.user.attach()
		def themes = user.templates
        def tset =[]
        def ad = SiteAdmin.get(1)
        def th = []
        def themes1 = ad.templates
        for(x in themes1)         {
            th.add(x.attach())

        }
        for (x in themes)  {
            tset.add(x.attach())
        }
		[themes:tset,admin:th]
		
		}
	
    def index() {
        redirect(action: "pref", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [salesInstanceList: Sales.list(params), salesInstanceTotal: Sales.count()]
    }

    def create() {
        [salesInstance: new Sales(params)]
    }

    def save() {
        def salesInstance = new Sales(params)
        if (!salesInstance.save(flush: true)) {
            render(view: "create", model: [salesInstance: salesInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'sales.label', default: 'Sales'), salesInstance.id])
        redirect(action: "show", id: salesInstance.id)
    }

    def show() {
        def salesInstance = Sales.get(params.id)
        if (!salesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sales.label', default: 'Sales'), params.id])
            redirect(action: "list")
            return
        }

        [salesInstance: salesInstance]
    }

    def edit() {
        def salesInstance = Sales.get(params.id)
        if (!salesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sales.label', default: 'Sales'), params.id])
            redirect(action: "list")
            return
        }

        [salesInstance: salesInstance]
    }

    def update() {
        def salesInstance = Sales.get(params.id)
        if (!salesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sales.label', default: 'Sales'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (salesInstance.version > version) {
                salesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sales.label', default: 'Sales')] as Object[],
                          "Another user has updated this Sales while you were editing")
                render(view: "edit", model: [salesInstance: salesInstance])
                return
            }
        }

        salesInstance.properties = params

        if (!salesInstance.save(flush: true)) {
            render(view: "edit", model: [salesInstance: salesInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'sales.label', default: 'Sales'), salesInstance.id])
        redirect(action: "show", id: salesInstance.id)
    }

    def delete() {
        def salesInstance = Sales.get(params.id)
        if (!salesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sales.label', default: 'Sales'), params.id])
            redirect(action: "list")
            return
        }

        try {
            salesInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'sales.label', default: 'Sales'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sales.label', default: 'Sales'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    
    def showTypes(){

        def user = session.dummy.attach()
        def pname

        def names = user.proType

        for (x in names){
            if (x.id == (Long.parseLong(params.id)))
            {
                pname = x.attach()
                break
            }
        }
        //cname = CustomCollection.get(Long.parseLong(params.id))
        def producTlist = []

        def cx = user.product

        for (x in cx){
            
            producTlist.add(x.attach())

        }
        def status = []
        def test
        boolean stat = false
        for(p in producTlist)
        {
           if (String.valueOf(p.type.id).equals(String.valueOf(pname.id)))  {
               stat = true
               status.add(p)
              
           }

            test = String.valueOf(p.id)
        }


       [pros:status]

    }
    def cart(){

    }
    def checkout(){
        def user = session.dummy.attach()
        def productList = []
        def cx = user.product
        if (params.x)   {
            
        String[] a =params.x.toString().split(",") 
            
         for(String z:a){

             for (x in cx){

                 if (x.id == Long.parseLong(z))    {
                 productList.add(x.attach())
                 break
                 }
             }
             
         }
         [arr:productList]
        }
     
    }

    def details(){
        path = request.contextPath
        def clist = []
        def temp
        def storeName
        def product
        def carr = []
        def tags
        if (session.user && params.id){

            def user = session.user.attach()

            product = Product.get(params.id)
          //  log.info(product.collection)

            tags = product.tags

            for (x in product.collection){
                carr.add(x)
            }


            if (user && user.profile){
                temp = user.profile.template
                if (temp.storeName)
                    storeName = temp.storeName
                else
                    storeName = user.userId


                def c = user.collection

                for (x in c){
                    if (x.parent )  {
                        continue
                    } else{
                        clist.add(x.attach())
                    }


                    //   log.info(x.root)
                }

            }else{
                flash.message = "No Store Profile Created"
                redirect(controller:'templates', action: 'site')
            }
        } else{
            flash.message = "Invalid URL"
            redirect(controller:'persistence', action: 'invalid')
        }


        [product:product,collection:carr,tags:tags,customCollectionInstanceList: clist,storeName:storeName]
    }


    def register(){

        def clist = []

        def storeName
        def temp
        def carr = []
        def tags

        if (session.user){

            def user = session.user.attach()

            if (user && user.profile){
                temp = user.profile.template
                if (temp.storeName)
                    storeName = temp.storeName
                else
                    storeName = user.userId


                def c = user.collection

                for (x in c){
                    if (x.parent )  {
                        continue
                    } else{
                        clist.add(x.attach())
                    }


                    //   log.info(x.root)
                }

            }else{
                flash.message = "No Store Profile Created"
                redirect(controller:'templates', action: 'site')
            }
        } else{
            flash.message = "Invalid URL"
            redirect(controller:'persistence', action: 'invalid')
        }


        [collection:carr,tags:tags,customCollectionInstanceList: clist,storeName:storeName]
    }


    def customers(){
        def user
        def cus
      
        if (session.user){
            user = session.user.attach()
            log.info "Creating Customer......................."
            cus = new Customer(cusEmailId: params.cusEmailId,cusUserId: params.cusUserId,cusPassword: params.cusPassword)
            log.info "${cus.validate()}"
            user.addToCustomer(cus)
            user.save() 
            flash.message = "Registered Successfully.Now You Can Login"
            redirect(controller: "sales",action: "register")
        }
      
    }
    
    def login(){
        boolean status = false
        
        if (params.cusUserId && params.cusPassword){
             def customer = Customer.findByCusUserId(params.cusUserId)
             if (customer){
                 if (customer.cusPassword.equals(params.cusPassword))
                 {
                     status = true
                     session['customer'] = customer
                 }
             }
        }
        
        if (status){
            flash.message = "Logged In Successfully"
            redirect(action: "store")
        }else{
             flash.message = "Wrong Credentials"
            redirect(action: "store")
        }
    }
    
    def logout(){
        if (session.customer){
            flash.message = "Logged Out Successfully"
            session.removeAttribute("customer")
            redirect(action: "store")
        }
        redirect(action: "store")
    }

     def remoteCart(){

         boolean already = false
        // log.info "Adding product ${params.id}"
         HashMap<Long,Integer> cart = new HashMap<Long,Integer>()
         if (params.id){
             if (session.cart){
                 Map<Long,Integer> list = (Map)session.cart

                 if (there(list,params.id)){
                     log.info("Product already in session")
                     already = true
                 }
                 
                 log.info "Session Exist"
                 
                 if (!already){

                     log.info "Previosly it had ${list}"

                     list.put(Product.get(params.id).id,1)

                     log.info "So Now its ${list}"

                     session.removeAttribute("cart")

                     session['cart'] = list
                 }

             }else{

                 cart.put(Product.get(params.id).id,1)
                 session['cart'] = cart
             }
            // log.info "The Cart contains : ${cart}"



         }

         if (session.cart)
         log.info "Session contains ${session.cart}"

         redirect(action: "details")

     }

    def just(){
        redirect(action: "details")
    }
    static String path;

    public static String makeCart(Long id){

        String builder = "<td>"
        def product = Product.get(id)
       // builder+=product.title
        if (product.image)
        builder=builder + "<img src='"+path+"/images/products/"+product.image+"' height='60' width='50'><br>"
        builder+=product.title
        builder+= "</td>"

        builder+="<td>"
        builder+=product.description
        builder+="</td>"

        builder+="<td>"
        builder+=product.sel_price
        builder+="</td>"

        builder+="<td>"
        builder+="<input type='text' size='2' name='quan' value='1'/>"
        builder+="</td>"

        builder+="<td>"
        builder+="<input type='text' size='4' name='quan' value='${product.sel_price}'/>"
        builder+="</td>"
        //return builder
       // builder+="<td>"
        //builder+=" <img src='<g:resource dir=\"images\" file=\"delete.png\" />' >"
        //builder+="</td>"

        return builder
    }

    def cartJson(){
        Set set1 = new HashSet()
        //Map map2 = new HashMap()
         if (session.cart){
             
             Map map = session.cart
             
             for (x in map.keySet()){
               def product = Product.get(x)
                 if (product)   {
                     set1.add(product)
                    // Set newSet = new HashSet()
                   //  newSet.add(product)
                   //  map2.put(newSet,map.get(x))
                 }


             }
             
         }
       
        log.info("The set that is sent is ...."+set1)
        render set1 as JSON
    }

    def tracker(){
        Map<Long,Integer> map
        int [] list = new int [2]
        if (session.cart && params.id){
            map = session.cart
         list[0] = map.get(Long.parseLong(params.id))
         def product = Product.get(Long.parseLong(params.id))
         double total = product.sel_price*list[0]
         list[1] = total
        }
        render list as JSON
    }

    def cartHelper(){
        Map<Long,Integer> map
      //  List temp
       def parent = []
        if (session.cart){
           map = session.cart
           for( x in map.keySet()){
               def list = []
               def product = Product.get(x)
               list.add(product.id)
               list.add(product.title)
               list.add(product.image)
               list.add(product.description)
               list.add(product.sel_price)
               list.add(map.get(x))
               double total = product.sel_price * map.get(x)
               list.add(total)
               parent.add(list)
           }
        }
        render parent as JSON
    }


    public static boolean there(Map set,Object obj){
        for (x in set.keySet()){
            if (x.toString().equals(obj.toString())){
                return true

            }
        }
        return false
    }

    def cartService(){  //Delete Service
        def list = []
        list.add("success")
        if (params.id && session.cart){
            Map set = session.cart
            Map newSet = new HashMap()
            if (set){
                log.info "set is ${set}"
                if (there(set,params.id)){
                    log.info ("Removing from Cart")
                    for (x in set.keySet()){
                      if (x.toString().equals(params.id.toString())){
                         continue
                      }else{
                          
                          newSet.put(x,set.get(x))
                      }
                    }

                    session.removeAttribute("cart")
                    session['cart'] = newSet
                    log.info "Now the Map become ${newSet}"
                }
                
            }
            
          
        }
        log.info "Params are ${params}"
       // render "Cart stuff....${params}"
        render list as JSON
    }


    def updateQuantity(){
        def list = []
        
        if (params.id && session.cart && params.quan){
            log.info "Quantiy sent is ${params.quan}"
            Map<Long,Integer> set = session.cart
           try{
               if (set){
                   log.info "set is ${set}"
                   if (there(set,params.id)){
                       log.info ("Update Quantity")
                       set.put(Long.parseLong(params.id),Integer.parseInt(params.quan))

                       session.removeAttribute("cart")
                       session['cart'] = set
                       log.info "Now the Map become ${set}"
                   }

               }  
           }catch(Exception ex){
              list.add("exception")
           }

            list.add("success")

        }
        render list as JSON
    }
    
    def review(){

        render "${session.cart  }"
    }
}
