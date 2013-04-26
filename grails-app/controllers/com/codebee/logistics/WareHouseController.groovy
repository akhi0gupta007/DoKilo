package com.codebee.logistics

import org.springframework.dao.DataIntegrityViolationException
import com.codebee.products.Product

class WareHouseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        def user = session.user.attach()
        def list = user.wareHouse

        [wareHouseInstanceList: list]
    }

    def create() {
        [wareHouseInstance: new WareHouse(params)]
    }

    def save() {
        def wareHouseInstance = new WareHouse(params)
        def user = session.user.attach()
        user.addToWareHouse(wareHouseInstance)
        if (!user.save(flush: true)) {
            render(view: "list")
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'wareHouse.label', default: 'WareHouse'), wareHouseInstance.id])
        redirect(action: "show", id: wareHouseInstance.id)
    }

    def show() {
        def user = session.user.attach()
        def arr12 = user.wareHouse
        int count = 0

       // def user = session.user.attach()
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

        def my
        for (x in arr12){
            if (Long.parseLong(params.id) == x.id)  {
                my =x.attach()
                break
            }

        }
        

        [wareHouseInstance: my,arr:entries]
    }

    def edit() {
        def wareHouseInstance = WareHouse.get(params.id)
        if (!wareHouseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wareHouse.label', default: 'WareHouse'), params.id])
            redirect(action: "list")
            return
        }

        [wareHouseInstance: wareHouseInstance]
    }

    def update() {
        def wareHouseInstance = WareHouse.get(params.id)
        if (!wareHouseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wareHouse.label', default: 'WareHouse'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (wareHouseInstance.version > version) {
                wareHouseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wareHouse.label', default: 'WareHouse')] as Object[],
                          "Another user has updated this WareHouse while you were editing")
                render(view: "edit", model: [wareHouseInstance: wareHouseInstance])
                return
            }
        }

        wareHouseInstance.properties = params

        if (!wareHouseInstance.save(flush: true)) {
            render(view: "edit", model: [wareHouseInstance: wareHouseInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'wareHouse.label', default: 'WareHouse'), wareHouseInstance.id])
        redirect(action: "show", id: wareHouseInstance.id)
    }

    def delete() {
        def wareHouseInstance = WareHouse.get(params.id)
        if (!wareHouseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'wareHouse.label', default: 'WareHouse'), params.id])
            redirect(action: "list")
            return
        }

        try {
            wareHouseInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'wareHouse.label', default: 'WareHouse'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wareHouse.label', default: 'WareHouse'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    
    def service(){
        def user = session.user.attach()
        def product = Product.get(params.id)
        if (product && toInteger(params.existing)){
         product.quan = toInteger(params.existing)
        }
        user.save(flush: true)
        redirect(action: "list")
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

}
