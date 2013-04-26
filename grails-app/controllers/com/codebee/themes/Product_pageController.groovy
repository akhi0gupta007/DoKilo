package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Product_pageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [product_pageInstanceList: Product_page.list(params), product_pageInstanceTotal: Product_page.count()]
    }

    def create() {
        [product_pageInstance: new Product_page(params)]
    }

    def save() {
        def product_pageInstance = new Product_page(params)
        if (!product_pageInstance.save(flush: true)) {
            render(view: "create", model: [product_pageInstance: product_pageInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'product_page.label', default: 'Product_page'), product_pageInstance.id])
        redirect(action: "show", id: product_pageInstance.id)
    }

    def show() {
        def product_pageInstance = Product_page.get(params.id)
        if (!product_pageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product_page.label', default: 'Product_page'), params.id])
            redirect(action: "list")
            return
        }

        [product_pageInstance: product_pageInstance]
    }

    def edit() {
        def product_pageInstance = Product_page.get(params.id)
        if (!product_pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product_page.label', default: 'Product_page'), params.id])
            redirect(action: "list")
            return
        }

        [product_pageInstance: product_pageInstance]
    }

    def update() {
        def product_pageInstance = Product_page.get(params.id)
        if (!product_pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product_page.label', default: 'Product_page'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (product_pageInstance.version > version) {
                product_pageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product_page.label', default: 'Product_page')] as Object[],
                          "Another user has updated this Product_page while you were editing")
                render(view: "edit", model: [product_pageInstance: product_pageInstance])
                return
            }
        }

        product_pageInstance.properties = params

        if (!product_pageInstance.save(flush: true)) {
            render(view: "edit", model: [product_pageInstance: product_pageInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'product_page.label', default: 'Product_page'), product_pageInstance.id])
        redirect(action: "show", id: product_pageInstance.id)
    }

    def delete() {
        def product_pageInstance = Product_page.get(params.id)
        if (!product_pageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product_page.label', default: 'Product_page'), params.id])
            redirect(action: "list")
            return
        }

        try {
            product_pageInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'product_page.label', default: 'Product_page'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product_page.label', default: 'Product_page'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
