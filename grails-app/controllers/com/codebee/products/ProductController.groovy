package com.codebee.products
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import grails.converters.JSON
import groovy.xml.MarkupBuilder
import com.codebee.AuthService
import com.codebee.User
import org.hibernate.Query
import org.hibernate.Session
import org.hibernate.SessionFactory
import org.hibernate.cfg.Configuration
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ProductController {

  //  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def AuthService
	boolean stat  = false

    ConfigObject holder = ConfigurationHolder.getConfig();
    def real = holder.getProperty("uploadProduct")
    def details(){
        
        def product = Product.get(params.id)
        log.info(product.collection)
        def carr = []
        def tags = product.tags
        for (x in product.collection){
            carr.add(x)
        }
        log.info(product.tax.class)
        [product:product,collection:carr,tags:tags]
    }
    
    def service(){
        def result = []
    if (params.id){
        def product = Product.get(params.id)
        result.add(product.title)
        result.add(product.quan)
    }   
        render result as JSON
    }
    
    def explore = {


        int count = 0

        def user = session.user.attach()
        /*
         int pageSize = 3,pageNumber = 1;

         def results =
             Product.findAll("from Product"+"",
                     [max: 10, offset: 20])
        */
        def var
        def pg
        if (params.page){
            var = params.page
        }else{
            var = 0
        }
        /*
        def books = Product.findAll("from Product as product where product.user = ?"+"order by product.id asc",
                [user],[max: 4, offset:var])
        */
        def entries = Product.createCriteria().list (max: 4, offset: var){

            and {

                eq('user', user)
                //    between('created', new Date()-1, new Date())
                //  tags {
                //    eq('name', 'Grails')
            }
            //  maxResults(3)
            order("id", "asc")

        }

        [arr:entries]
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
            
            if (!entries){

                 entries = Product.withCriteria {
                     eq('user', user)
                     tags{
                         like('name',cri)
                     }
                 }

                 /*
                    log.info("bad days")
                    entries = user.product.tags.find {
                       it.name == params.tag
                        log.info("simple "+it.name)
                   }
                log.info(entries)
                */
            }


            /*
            def str ="type"
            if (!entries){

                entries = Product.withCriteria {
                    eq('user', user)
                    str{
                        like('type',cri)
                    }
                }

            } */

        }
       [arr: entries]
       // render "Results for ${params.tag} ${entries.title}"
    }
    
    def ajaxDelete = {

        def user = session.user.attach()
        def arr = user.product
        def del
        def my =[]
        for (x in arr){
            if (x.id == Long.parseLong(params.id))     {
                del = x.attach()
                break
            }

        }
        log.info("the deleted object shall be"+del)
        user.product.remove(del)
        del.delete(flush:true)
        user.save()
        flash.message = "${del.title} deleted"
        redirect(action: "another")
        /*
        def book = Book.get( params.id )

        if(bookInstance) {
            try {
                bookInstance.delete(flush:true)
                render "Book ${params.id} deleted"
            } catch(org.springframework.dao.DataIntegrityViolationException e) {
                render "Book ${params.id} could not be deleted"
            }
        } else {
            flash.message = "Book not found with id ${params.id}"
            redirect(action:list)
        }
        */
    }
	    def another(){

          // params.max = Math.min(params.max ? params.int('max') : 3, 20)

        int count = 0

        def user = session.user.attach()
         /*
            int pageSize = 3,pageNumber = 1;

            def results =
                Product.findAll("from Product"+"",
                        [max: 10, offset: 20])
           */
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
                       /*
            def books = Product.findAll("from Product as product where product.user = ?"+"order by product.id asc",
                    [user],[max: 4, offset:var])
            */
            def entries = Product.createCriteria().list (max: 4, offset: var){

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

        [arr:entries]
    }

    def templates(){
        def entries
        def user = session.user.attach()
        if(user){

            entries = ProTemplates.createCriteria().list {

                and {

                    eq('user', user)
                    //    between('created', new Date()-1, new Date())
                    //  tags {
                    //    eq('name', 'Grails')
                }
                and{
                    eq('flag','N')
                }
                //  maxResults(3)
                order("id", "asc")

            }
        }
        [entries:entries]
    }
    

    def list() {
        [productInstanceTotal: Product.list(params),productInstanceTotal: Product.count()]
    }
	def demo(){
		redirect(action:"showing")
		}
	def showList(){}
	def showing(){
        def entries
        def user = session.user.attach()
        if(user){

            entries = ProTemplates.createCriteria().list {

                and {

                    eq('user', user)
                    //    between('created', new Date()-1, new Date())
                    //  tags {
                    //    eq('name', 'Grails')
                }
                and{
                    eq('flag','N')
                }
                //  maxResults(3)
                order("id", "asc")

            }
        }
		[entries:entries]
		}

	def added() {
      //  log.info("Came agaon")
		boolean img = false
		def user = session.user.attach()
		def dir
		def his = user.userId
        def proTemplates
		def val=session["token"]
		String my=session["val"]
		
	if(params.title){
		if(session["user"]){

            if (params.fields && params.custom){

                def template = ProTemplates.get(params.fields)
                // int k= template.nameValuePair.size()
                def list= []

                for (x in template.nameValuePair){
                    list.add(x)
                }
                Object[] obj= list.toArray(new Object[list.size()]);
                bubbleSort1(obj)
                list = null
                list = Arrays.asList(obj)

                 proTemplates = new ProTemplates(name:template.name,user:user,flag:'Y');

                if (params.custom instanceof String[]){

                    for (int i=0;i<params.custom.length;i++){
                        def nameValuePair = new NameValuePair(name:list[i].name,value:params.custom[i]);

                        proTemplates.addToNameValuePair(nameValuePair)
                        //   proTemplates.addToNameValuePair(nameValuePair)
                    }
                }else{
                    def nameValuePair = new NameValuePair(name:list[0].name,value:params.custom);

                    proTemplates.addToNameValuePair(nameValuePair)

                }
                user.addToProTemplates(proTemplates)
                //Checking


            }
            
            def variant = new Variants(params);

            if (params.attr_name && params.attr_value){
               // log.info (params.attr_name.length.class)

                if (params.attr_name instanceof String[]){

                    for (int i =0;i<params.attr_name.length;i++){
                        def custom = new CustomVariant(name:params.attr_name[i],value:params.attr_value[i])
                        variant.addToCustomVariant(custom)
                    }

                }else{

                    def custom = new CustomVariant(name:params.attr_name,value:params.attr_value)
                    variant.addToCustomVariant(custom)
                }
            }

            
			if(request instanceof MultipartHttpServletRequest){
			
			
			MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
		
			def imgname = "pro_${his}_${params.title.toString().replaceAll("\\s","_")}.png"
			 dir = real + imgname
			def mhsr = request.getFile('photo')
			
			if (!mhsr?.empty && mhsr.size) {
				mhsr.transferTo(
				new File(
				dir
				)
				)
				}
				
			dir = imgname
			img = true
	
		}
			log.info("Adding image :"+dir+""+img)
			def productInstance = new Product(params)
			
			if(img)
			productInstance.image = dir
			def test
			def customCollection
			boolean status = false
			if(params.coll!= null && params.coll != '0' && params.coll != ''){
				if(isLong(params.coll)){
					
					def index = params.coll
					def arr = user.collection
				 	for(x in arr){
						 String s = x.id
						 
						 if(s.equals(index))
						 		{
									 //status = true
									 test = x.id
									 customCollection = x
								 }
						 }
					 
				}
				else{
				    customCollection = new CustomCollection(name:params.coll)
					customCollection.save()
					user.addToCollection(customCollection)
				}
					
					productInstance.addToCollection(customCollection)
			}
			
			def ty
			
			if(params.ptype!= null && params.ptype != '0' && params.ptype != ''){
				
				if(isLong(params.ptype)){
										
					def index = params.ptype
					def arr = user.proType
					 for(x in arr){
						 String s = x.id
						 
						 if(s.equals(index))
								 {
									// status = true
									 test = x.id
									 ty = x
								 }
						 }
					
					}else{
					ty= new ProType(type:params.ptype)
					ty.save()
					}
					
				user.addToProType(ty)
				productInstance.type = ty
				
			}
			
		    //Vendor thing
		  	def ven
			if(params.vendors!= null && params.vendors != '0' && params.vendors != ''){
				
				if(isLong(params.vendors)){
					
					def index = params.vendors
					def arr = user.vendor
					 for(x in arr){
						 String s = x.id
						 
						 if(s.equals(index))
								 {
									 status = true
									 test = x.id
									 ven = x
								 }
						 }
					 
					}else{
					ven = new Vendor(ven_name:params.vendors)
					ven.save()
					}
					
				user.addToVendor(ven)
				productInstance.vendor = ven
				
			}

            if (params.tag){

                String str = params.tag
                if (str.find(",")){

                    String[] arr = str.split(",")

                    if (arr){
                        for (x in arr){

                            def find = Tag.findByNameAndUser(x,user)

                            if (!find){
                                def tag = new Tag(name: x)
                                user.addToTags(tag)
                                productInstance.addToTags(tag)
                            }else{
                                for (f in find){
                                    productInstance.addToTags(f)
                                }
                            }

                        }
                    }
                }


            }

			if (variant)
            productInstance.variants = variant

            if (proTemplates)
            productInstance.proTemplates = proTemplates

			productInstance.save()
			user.addToProduct(productInstance)
			user.save(flush: true)
            flash.message = "${params.title} Added Successfully"
            redirect(uri: "/product/another?page=0")
			//render "The ${test} and ${customCollection}  and ${params.coll}params were ${params}"
            //log.info(params.quan)
		}else{
		render "Unauthorised ${my} and ${params.id}"
		}
	}else{



	render "UnAvailable ${ params.tag.find(",")}  "
	}
	
}


    def change(){
        def user = session.user.attach()
        def product
        if (params.title && params.id){

             product = Product.get(params.id)
             product.title = params.title
             product.description = params.description

            if (!(toDouble(params.sel_price) < 0))
             product.sel_price = toDouble(params.sel_price)

            if (!(toInteger(params.quan) < 0))
             product.quan = toInteger(params.quan)


             product.tax = params.tax
             product.dimen = params.dimen

            if (!(toDouble(params.weight) < 0))
             product.weight = toDouble(params.weight)

            if (params.vendor){
                def vendor = Vendor.findByVen_name(params.vendor)
                if (vendor){
                    product.vendor = vendor
                }else{
                    def ven = new Vendor(ven_name:params.vendor)
                    product.vendor = vendor
                    user.addToVendor(ven)
                }
            }
            def dir
            boolean img = false

            def list = []
            if (product.proTemplates) {
                  for(x in product.proTemplates.nameValuePair){
                      list.add(x.attach())
                  }
            }

            Object[] obj= list.toArray(new Object[list.size()]);
            bubbleSort1(obj)
            list = null
            list = Arrays.asList(obj)

          if (params.custom){

              if (list && params.custom instanceof String[]) {
                  int i = 0
                  for (x in list) {

                      x.value = params.custom[i]
                      log.info "Adding "+ params.custom[i] +" in "+x.name
                      // proTemplates.addToNameValuePair(nameValuePair)
                      //   proTemplates.addToNameValuePair(nameValuePair)
                      i++
                  }
              }else{

                  list[0].value = params.custom
              }
          }
            

            String truncated
            if(request instanceof MultipartHttpServletRequest){
                 def his = user.userId
                 String str= params.title.toString()
                 truncated = str.trim()
                log.info("Truncated image ...."+ truncated)
                MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
                
                def imgname = "pro_${his}_${truncated.replaceAll("\\s","_")}.png"
                dir = real + imgname
                def mhsr = request.getFile('photo')

                if (!mhsr?.empty && mhsr.size) {
                    mhsr.transferTo(
                            new File(
                                    dir
                            )
                    )
                }

                dir = imgname
                img = true

            }
            if (img)
            product.image = dir

             user.save(flush: true)
        }
        flash.message = "${params.title} ,Changes Saved Successfully"
        redirect(uri: "/product/another?page=0")
    }

    public double toDouble(String x){

        double d;
         try{
            d =  Double.parseDouble(x)
            return d
         } catch(NumberFormatException ex){
            return -1
         }
    }

    public int toInteger(String x){

        int d;

        try{
            d =  Integer.parseInt(x)
            return d
        } catch(NumberFormatException ex){
            return -1
        }
    }

    public void bubbleSort1(Object[] x) {
        int n = x.length;
        for (int pass=1; pass < n; pass++) {  // count how many times
            // This next loop becomes shorter and shorter
            for (int i=0; i < n-pass; i++) {
                if (x.id[i] > x.id[i+1]) {
                    // exchange elements
                    Object temp = x[i];  x[i] = x[i+1];  x[i+1] = temp;
                }
            }
        }
    }


    def edit(){

        def product = Product.get(params.id)
        log.info(product.collection)
        def carr = []
        def tags = product.tags
        def list = []
        if (product.proTemplates){

            for (x in product.proTemplates.nameValuePair){
                list.add(x)
            }
            Object[] obj= list.toArray(new Object[list.size()]);
            bubbleSort1(obj)
            list = null
            list = Arrays.asList(obj)

        }

         log.info list
        for (x in product.collection){
            carr.add(x)
        }
        [product:product,collection:carr,list: list,tags: tags]
    }

    def by(){

        def template = ProTemplates.get(params.id)
        // int k= template.nameValuePair.size()
        def list= []

        for (x in template.nameValuePair){
            list.add(x)
        }
        Object[] obj= list.toArray(new Object[list.size()]);
        bubbleSort1(obj)
        list = null
        list = Arrays.asList(obj)

     [fields:template,list:list]
    }

    def showMe(){
	def val=session["token"]
	String my=session["val"]
	def result = []
	//if(params.id && params.token && params.proid)
		//if((my.equals(params.id))&&(session["token"].equals(params.token))){
			
			def user = User.get(params.id)
			Iterator itr = user.product.iterator()
			while(itr.hasNext()){
				
				}
			//def title = product.title
		///	result = [name:product]
			
			
			
		//	}
		//result= [token:params.token]
		render result as JSON;
	}	
	
	public boolean isLong( String input )
	{
	   try
	   {
		  Long.parseLong( input );
		  return true;
	   }
	   catch( Exception )
	   {
		  return false;
	   }
	}

    public int rowCount(){
          ++rowCount
    }
	 int rowCount=0

}
	


	
	

