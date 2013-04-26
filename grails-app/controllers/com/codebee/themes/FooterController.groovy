package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class FooterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [footerInstanceList: Footer.list(params), footerInstanceTotal: Footer.count()]
    }

    def create() {
        [footerInstance: new Footer(params)]
    }

    def save() {
        def footerInstance = new Footer(params)
        if (!footerInstance.save(flush: true)) {
            render(view: "create", model: [footerInstance: footerInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'footer.label', default: 'Footer'), footerInstance.id])
        redirect(action: "show", id: footerInstance.id)
    }

    def show() {
        def footerInstance = Footer.get(params.id)
        if (!footerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'footer.label', default: 'Footer'), params.id])
            redirect(action: "list")
            return
        }

        [footerInstance: footerInstance]
    }

    def edit() {
        def footerInstance = Footer.get(params.id)
        if (!footerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'footer.label', default: 'Footer'), params.id])
            redirect(action: "list")
            return
        }

        [footerInstance: footerInstance]
    }

    def update() {
        def footerInstance = Footer.get(params.id)
        if (!footerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'footer.label', default: 'Footer'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (footerInstance.version > version) {
                footerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'footer.label', default: 'Footer')] as Object[],
                          "Another user has updated this Footer while you were editing")
                render(view: "edit", model: [footerInstance: footerInstance])
                return
            }
        }

        footerInstance.properties = params

        if (!footerInstance.save(flush: true)) {
            render(view: "edit", model: [footerInstance: footerInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'footer.label', default: 'Footer'), footerInstance.id])
        redirect(action: "show", id: footerInstance.id)
    }

    def delete() {
        def footerInstance = Footer.get(params.id)
        if (!footerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'footer.label', default: 'Footer'), params.id])
            redirect(action: "list")
            return
        }

        try {
            footerInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'footer.label', default: 'Footer'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'footer.label', default: 'Footer'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
