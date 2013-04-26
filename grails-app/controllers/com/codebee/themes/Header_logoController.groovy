package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Header_logoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [header_logoInstanceList: Header_logo.list(params), header_logoInstanceTotal: Header_logo.count()]
    }

    def create() {
        [header_logoInstance: new Header_logo(params)]
    }

    def save() {
        def header_logoInstance = new Header_logo(params)
        if (!header_logoInstance.save(flush: true)) {
            render(view: "create", model: [header_logoInstance: header_logoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'header_logo.label', default: 'Header_logo'), header_logoInstance.id])
        redirect(action: "show", id: header_logoInstance.id)
    }

    def show() {
        def header_logoInstance = Header_logo.get(params.id)
        if (!header_logoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_logo.label', default: 'Header_logo'), params.id])
            redirect(action: "list")
            return
        }

        [header_logoInstance: header_logoInstance]
    }

    def edit() {
        def header_logoInstance = Header_logo.get(params.id)
        if (!header_logoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_logo.label', default: 'Header_logo'), params.id])
            redirect(action: "list")
            return
        }

        [header_logoInstance: header_logoInstance]
    }

    def update() {
        def header_logoInstance = Header_logo.get(params.id)
        if (!header_logoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_logo.label', default: 'Header_logo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (header_logoInstance.version > version) {
                header_logoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'header_logo.label', default: 'Header_logo')] as Object[],
                          "Another user has updated this Header_logo while you were editing")
                render(view: "edit", model: [header_logoInstance: header_logoInstance])
                return
            }
        }

        header_logoInstance.properties = params

        if (!header_logoInstance.save(flush: true)) {
            render(view: "edit", model: [header_logoInstance: header_logoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'header_logo.label', default: 'Header_logo'), header_logoInstance.id])
        redirect(action: "show", id: header_logoInstance.id)
    }

    def delete() {
        def header_logoInstance = Header_logo.get(params.id)
        if (!header_logoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_logo.label', default: 'Header_logo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            header_logoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'header_logo.label', default: 'Header_logo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'header_logo.label', default: 'Header_logo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
