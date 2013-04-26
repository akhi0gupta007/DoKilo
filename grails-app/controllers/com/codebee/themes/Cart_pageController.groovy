package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Cart_pageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cart_pageInstanceList: Cart_page.list(params), cart_pageInstanceTotal: Cart_page.count()]
    }

    def create() {
        [cart_pageInstance: new Cart_page(params)]
    }

    def save() {
        def cart_pageInstance = new Cart_page(params)
        if (!cart_pageInstance.save(flush: true)) {
            render(view: "create", model: [cart_pageInstance: cart_pageInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'cart_page.label', default: 'Cart_page'), cart_pageInstance.id])
        redirect(action: "show", id: cart_pageInstance.id)
    }

    def show() {
        def cart_pageInstance = Cart_page.get(params.id)
        if (!cart_pageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cart_page.label', default: 'Cart_page'), params.id])
            redirect(action: "list")
            return
        }

        [cart_pageInstance: cart_pageInstance]
    }

    def edit() {
        def cart_pageInstance = Cart_page.get(params.id)
        if (!cart_pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cart_page.label', default: 'Cart_page'), params.id])
            redirect(action: "list")
            return
        }

        [cart_pageInstance: cart_pageInstance]
    }

    def update() {
        def cart_pageInstance = Cart_page.get(params.id)
        if (!cart_pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cart_page.label', default: 'Cart_page'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cart_pageInstance.version > version) {
                cart_pageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cart_page.label', default: 'Cart_page')] as Object[],
                          "Another user has updated this Cart_page while you were editing")
                render(view: "edit", model: [cart_pageInstance: cart_pageInstance])
                return
            }
        }

        cart_pageInstance.properties = params

        if (!cart_pageInstance.save(flush: true)) {
            render(view: "edit", model: [cart_pageInstance: cart_pageInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'cart_page.label', default: 'Cart_page'), cart_pageInstance.id])
        redirect(action: "show", id: cart_pageInstance.id)
    }

    def delete() {
        def cart_pageInstance = Cart_page.get(params.id)
        if (!cart_pageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cart_page.label', default: 'Cart_page'), params.id])
            redirect(action: "list")
            return
        }

        try {
            cart_pageInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cart_page.label', default: 'Cart_page'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cart_page.label', default: 'Cart_page'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
