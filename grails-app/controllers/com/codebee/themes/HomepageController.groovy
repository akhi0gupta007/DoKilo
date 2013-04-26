package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException
import com.codebee.products.Product
import com.codebee.products.SmartCollection

class HomepageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

   def configure(){
        def user = session.user.attach()
       def max
       def search
       def recently
       def featured

       if (user.profile){
           def temp =  user.profile.template
           if (temp.homePage)      {

               def home = temp.homePage.attach()

               max =  home.max_no_items
               search =   home.search
               recently = home.recently
               featured =  home.featured
           }

       }
       [max:max,search: search,recently: recently,featured: featured]
   }

   def featured(){
       def user = session.user.attach()
       def var
       def pg
       def by
       def ord
       def my
       def newList = [] 
       
       if (user.featured){
           log.info "featured............................${user.featured.product}"
            def feat = user.featured.product
            for (x in feat){
              //  log.info("..........${x}")
                newList.add(x.attach())
            }
       }

       log.info ("the list is ${newList}")
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

       if (newList)
           [arr:entries1,my:newList]
       else
           [arr:entries1]
   }



    def put(){

        if(params.deleted){

            def user = session.user.attach()
            def pros = user.product
            def productList = []
            def featured
            for (x in pros){
                productList.add(x.attach())

            }
            def added = []
            def single
            def addc

            if (params.deleted instanceof String[]){
                log.info "multiple adding"

                for (z in params.deleted){

                    for(x in productList){

                        if(String.valueOf(x.id).equals(z)){
                            added.add(x.attach())
                            log.info("guess wat")
                            break

                        }
                    }
                }


            }else{
                log.info "Single adding"
                for(x in productList){

                    if(String.valueOf(x.id).equals(params.deleted)){
                        single = x
                        break
                    }
                }
            }

            /*
            *
            * Getting Existing Featured Object
            * */

             if (user.featured)   {
                featured = user.featured.attach()
            }
            else  {
                log.info "No featured ,creating new one"
                featured = new SmartCollection(user: user)
            }

         
            log.info "Array is ${added} and single is ${single}"

            if (single) {

                featured.addToProduct(single)

            } else if (added) {
                 for ( x in added){
                  featured.addToProduct(x)   
                 }
            }
            
            if (featured){
                log.info("${featured.validate()}................................")
                //featured.save(flush: true)
               // user.featured = featured

            }

            if (user.featured)
                user.merge()
            else
                user.save()

            flash.message = "Added in Featured..."

            redirect(action: "featured")
           // render "${params}"
        }else{
            render "nothing"

        }
        render "${params}"
    }

    def remove(){

        def user = session.user.attach()
        def delete
        if (params.coll){


            for (x in user.product){
                if (x.id == Long.parseLong(params.coll))     {
                    delete = x.attach()
                    break
                }
            }
        
            if(user.featured && delete){
                log.info "going to remove ${delete.title}"
                def featured = user.featured.attach()
                featured.product.remove(delete)
                featured.save()
                user.merge()
            }

        }

        flash.message ="${delete.title}:Removed"

        redirect(action:"featured")
    }

    def aboutUs(){

    }
    
    def about(){
        
        if (session.user){
          def user =session.user.attach()
          if (params.elm1){
               user.aboutUs = params.elm1
               user.save()
              flash.message = "Saved"
              redirect(action: "aboutUs")
          }
        }

        
    }

    def save(){
       boolean search  = false
       boolean featured  = false
       boolean recently = false
       def max  

        if (params.search == 'true')
            search=true

        if (params.featured == 'true')
            featured = true

        if (params.recently == 'true')
            recently= true

        if (params.max_no_items)
           max = params.max_no_items

        def homepage = new Homepage(search: search,featured: featured,max_no_items: max,recently: recently)

        def user = session.user.attach()
        
        if (user.profile.template){
            log.info "Templates Found"
            def template = user.profile.template.attach()
            template.homePage = homepage
            template.save(flush:true)
            user.save(flush: true)
            flash.message = "Saved"
            redirect(action: "configure")
        }else{
            flash.message = 'Store Profile is not set.Please set first'
            redirect(controller: 'templates',action: 'site')
        }
        render " ${homepage.validate()}"
    }

}
