package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Header_cartController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [header_cartInstanceList: Header_cart.list(params), header_cartInstanceTotal: Header_cart.count()]
    }

    def create() {
        [header_cartInstance: new Header_cart(params)]
    }

    def save() {
        def header_cartInstance = new Header_cart(params)
        if (!header_cartInstance.save(flush: true)) {
            render(view: "create", model: [header_cartInstance: header_cartInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'header_cart.label', default: 'Header_cart'), header_cartInstance.id])
        redirect(action: "show", id: header_cartInstance.id)
    }

    def show() {
        def header_cartInstance = Header_cart.get(params.id)
        if (!header_cartInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_cart.label', default: 'Header_cart'), params.id])
            redirect(action: "list")
            return
        }

        [header_cartInstance: header_cartInstance]
    }

    def edit() {
        def header_cartInstance = Header_cart.get(params.id)
        if (!header_cartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_cart.label', default: 'Header_cart'), params.id])
            redirect(action: "list")
            return
        }

        [header_cartInstance: header_cartInstance]
    }

    def update() {
        def header_cartInstance = Header_cart.get(params.id)
        if (!header_cartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_cart.label', default: 'Header_cart'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (header_cartInstance.version > version) {
                header_cartInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'header_cart.label', default: 'Header_cart')] as Object[],
                          "Another user has updated this Header_cart while you were editing")
                render(view: "edit", model: [header_cartInstance: header_cartInstance])
                return
            }
        }

        header_cartInstance.properties = params

        if (!header_cartInstance.save(flush: true)) {
            render(view: "edit", model: [header_cartInstance: header_cartInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'header_cart.label', default: 'Header_cart'), header_cartInstance.id])
        redirect(action: "show", id: header_cartInstance.id)
    }

    def delete() {
        def header_cartInstance = Header_cart.get(params.id)
        if (!header_cartInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_cart.label', default: 'Header_cart'), params.id])
            redirect(action: "list")
            return
        }

        try {
            header_cartInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'header_cart.label', default: 'Header_cart'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'header_cart.label', default: 'Header_cart'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
