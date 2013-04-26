package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException

class VariantsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [variantsInstanceList: Variants.list(params), variantsInstanceTotal: Variants.count()]
    }

    def create() {
        [variantsInstance: new Variants(params)]
    }

    def save() {
        def variantsInstance = new Variants(params)
        if (!variantsInstance.save(flush: true)) {
            render(view: "create", model: [variantsInstance: variantsInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'variants.label', default: 'Variants'), variantsInstance.id])
        redirect(action: "show", id: variantsInstance.id)
    }

    def show() {
        def variantsInstance = Variants.get(params.id)
        if (!variantsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'variants.label', default: 'Variants'), params.id])
            redirect(action: "list")
            return
        }

        [variantsInstance: variantsInstance]
    }

    def edit() {
        def variantsInstance = Variants.get(params.id)
        if (!variantsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'variants.label', default: 'Variants'), params.id])
            redirect(action: "list")
            return
        }

        [variantsInstance: variantsInstance]
    }

    def update() {
        def variantsInstance = Variants.get(params.id)
        if (!variantsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'variants.label', default: 'Variants'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (variantsInstance.version > version) {
                variantsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'variants.label', default: 'Variants')] as Object[],
                          "Another user has updated this Variants while you were editing")
                render(view: "edit", model: [variantsInstance: variantsInstance])
                return
            }
        }

        variantsInstance.properties = params

        if (!variantsInstance.save(flush: true)) {
            render(view: "edit", model: [variantsInstance: variantsInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'variants.label', default: 'Variants'), variantsInstance.id])
        redirect(action: "show", id: variantsInstance.id)
    }

    def delete() {
        def variantsInstance = Variants.get(params.id)
        if (!variantsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'variants.label', default: 'Variants'), params.id])
            redirect(action: "list")
            return
        }

        try {
            variantsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'variants.label', default: 'Variants'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'variants.label', default: 'Variants'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
