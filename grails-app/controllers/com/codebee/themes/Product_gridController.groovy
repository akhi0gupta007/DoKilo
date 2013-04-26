package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Product_gridController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [product_gridInstanceList: Product_grid.list(params), product_gridInstanceTotal: Product_grid.count()]
    }

    def create() {
        [product_gridInstance: new Product_grid(params)]
    }

    def save() {
        def product_gridInstance = new Product_grid(params)
        if (!product_gridInstance.save(flush: true)) {
            render(view: "create", model: [product_gridInstance: product_gridInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'product_grid.label', default: 'Product_grid'), product_gridInstance.id])
        redirect(action: "show", id: product_gridInstance.id)
    }

    def show() {
        def product_gridInstance = Product_grid.get(params.id)
        if (!product_gridInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product_grid.label', default: 'Product_grid'), params.id])
            redirect(action: "list")
            return
        }

        [product_gridInstance: product_gridInstance]
    }

    def edit() {
        def product_gridInstance = Product_grid.get(params.id)
        if (!product_gridInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product_grid.label', default: 'Product_grid'), params.id])
            redirect(action: "list")
            return
        }

        [product_gridInstance: product_gridInstance]
    }

    def update() {
        def product_gridInstance = Product_grid.get(params.id)
        if (!product_gridInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product_grid.label', default: 'Product_grid'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (product_gridInstance.version > version) {
                product_gridInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product_grid.label', default: 'Product_grid')] as Object[],
                          "Another user has updated this Product_grid while you were editing")
                render(view: "edit", model: [product_gridInstance: product_gridInstance])
                return
            }
        }

        product_gridInstance.properties = params

        if (!product_gridInstance.save(flush: true)) {
            render(view: "edit", model: [product_gridInstance: product_gridInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'product_grid.label', default: 'Product_grid'), product_gridInstance.id])
        redirect(action: "show", id: product_gridInstance.id)
    }

    def delete() {
        def product_gridInstance = Product_grid.get(params.id)
        if (!product_gridInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product_grid.label', default: 'Product_grid'), params.id])
            redirect(action: "list")
            return
        }

        try {
            product_gridInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'product_grid.label', default: 'Product_grid'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product_grid.label', default: 'Product_grid'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
