package com.codebee.logistics

import org.springframework.dao.DataIntegrityViolationException

class ShippingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def home(){

        def user = session.user.attach()
        def entries = Shipping.createCriteria().list{

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





    def decide(){

    }

    def add(){
        def ship = new Shipping(params)
        def user = session.user
        if (!user.isAttached())  {
            user.attach()
           // if (ship.validate())      {
             //   ship.save()
                user.addToShipping(ship)
                user.save()
                flash.message = "Added Successfully"
                redirect(action: "home")
            //}
            //else  {
              //  render "Failure"   + ship.errors
            //}
        }

    }

    def ajaxDelete = {

        def user = session.user.attach()
        def arr = user.shipping
        def del
        def my =[]
        for (x in arr){
            if (x.id == Long.parseLong(params.id))     {
            del = x.attach()
            break
            }

        }
        log.info("the deleted object shall be"+del)
        user.shipping.remove(del)
        del.delete(flush:true)
        user.save()
        flash.message = "${del.plan} deleted"
        redirect(action: "home")
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

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 1, 1)
        [shippingInstanceList: Shipping.list(params), shippingInstanceTotal: Shipping.count()]
    }

    def create() {
        [shippingInstance: new Shipping(params)]
    }

    def save() {
        def shippingInstance = new Shipping(params)
        if (!shippingInstance.save(flush: true)) {
            render(view: "create", model: [shippingInstance: shippingInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'shipping.label', default: 'Shipping'), shippingInstance.id])
        redirect(action: "show", id: shippingInstance.id)
    }

    def show() {
        def shippingInstance = Shipping.get(params.id)
        if (!shippingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'shipping.label', default: 'Shipping'), params.id])
            redirect(action: "list")
            return
        }

        [shippingInstance: shippingInstance]
    }

    def edit() {
        def shippingInstance = Shipping.get(params.id)
        if (!shippingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shipping.label', default: 'Shipping'), params.id])
            redirect(action: "list")
            return
        }

        [shippingInstance: shippingInstance]
    }

    def update() {
        def shippingInstance = Shipping.get(params.id)
        if (!shippingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shipping.label', default: 'Shipping'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (shippingInstance.version > version) {
                shippingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'shipping.label', default: 'Shipping')] as Object[],
                          "Another user has updated this Shipping while you were editing")
                render(view: "edit", model: [shippingInstance: shippingInstance])
                return
            }
        }

        shippingInstance.properties = params

        if (!shippingInstance.save(flush: true)) {
            render(view: "edit", model: [shippingInstance: shippingInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'shipping.label', default: 'Shipping'), shippingInstance.id])
        redirect(action: "show", id: shippingInstance.id)
    }

    def delete() {
        def shippingInstance = Shipping.get(params.id)
        if (!shippingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'shipping.label', default: 'Shipping'), params.id])
            redirect(action: "list")
            return
        }

        try {
            shippingInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'shipping.label', default: 'Shipping'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shipping.label', default: 'Shipping'), params.id])
            redirect(action: "show", id: params.id)
        }
    }


}
