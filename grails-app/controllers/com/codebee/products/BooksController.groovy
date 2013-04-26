package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException

class BooksController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def renderImage = {
      //  def user = User.findByUserId(params.id)

        BooksArch obj
        Object o
        boolean status = false
        obj  = new BooksArch()
        obj  = obj.getBook(params.id)
        o = obj.getAuthor()
        if (obj.getData() != null ) {
            response.setContentLength(obj.data.length)
            response.outputStream.write(obj.data)

        } else {
             status = true
            
           response.sendError(404)
        }
        render "${status} ${o}"
    }


    def books(){
        BooksArch obj  = new BooksArch()
        if (params.isbn){
           obj  = new BooksArch()
           obj  = obj.getBook(params.isbn)
            [display:obj]
        }


       /*
        def user = session.user.attach()
        def books=new Books(isbn:"232d",title:"laptop",sel_price:20,pro_id:"de12",description:"this is gud thing to take home")
        //def cusColl=new CustomCollection(name:"Laptops", description:"The Laptop series",image:"web-app/images/Image001.png")
       // user.addToCollection(cusColl)
        //product.addToCollection(cusColl)
        user.addToProduct(books)
        user.save()
        println(books.validate())

      /*  for (x in product.collection){
            println(x.description)
        }
        */
       // render "books ${my.name}"
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

    def booksAdd(){
        def user = session.user.attach()
        def productInstance = new Books(sel_price:params.sel_price,title:params.title,description:params.description,
                pro_id:params.pro_id,weight:params.weight,tax:params.tax,isbn: params.isbn,isbn13:params.isbn13,binding:params.binding,pub_date:params.pub_date,
                publisher:params.publisher,no_of_pages:params.no_of_pages,language:params.language,edition:params.edition,author: params.author)
       /*
        BooksArch obj = new BooksArch()
        obj  = obj.getBook(params.isbn)
        productInstance.data = obj.getData()
        */
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
                        break
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
                        break
                    }
                }

            }else{
                ty= new ProType(type:params.ptype)
                ty.save()
            }

            user.addToProType(ty)
            productInstance.type = ty

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


        user.addToProduct(productInstance)
        user.save()
        render "${productInstance.validate()}"
    }
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [booksInstanceList: Books.list(params), booksInstanceTotal: Books.count()]
    }

    def create() {
        [booksInstance: new Books(params)]
    }

    def save() {
        def booksInstance = new Books(params)
        if (!booksInstance.save(flush: true)) {
            render(view: "create", model: [booksInstance: booksInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'books.label', default: 'Books'), booksInstance.id])
        redirect(action: "show", id: booksInstance.id)
    }

    def show() {
        def booksInstance = Books.get(params.id)
        if (!booksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), params.id])
            redirect(action: "list")
            return
        }

        [booksInstance: booksInstance]
    }

    def edit() {
        def booksInstance = Books.get(params.id)
        if (!booksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), params.id])
            redirect(action: "list")
            return
        }

        [booksInstance: booksInstance]
    }

    def update() {
        def booksInstance = Books.get(params.id)
        if (!booksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (booksInstance.version > version) {
                booksInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'books.label', default: 'Books')] as Object[],
                        "Another user has updated this Books while you were editing")
                render(view: "edit", model: [booksInstance: booksInstance])
                return
            }
        }

        booksInstance.properties = params

        if (!booksInstance.save(flush: true)) {
            render(view: "edit", model: [booksInstance: booksInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'books.label', default: 'Books'), booksInstance.id])
        redirect(action: "show", id: booksInstance.id)
    }

    def delete() {
        def booksInstance = Books.get(params.id)
        if (!booksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'books.label', default: 'Books'), params.id])
            redirect(action: "list")
            return
        }

        try {
            booksInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'books.label', default: 'Books'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'books.label', default: 'Books'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
