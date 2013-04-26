package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Header_navController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [header_navInstanceList: Header_nav.list(params), header_navInstanceTotal: Header_nav.count()]
    }

    def create() {
        [header_navInstance: new Header_nav(params)]
    }

    def save() {
        def header_navInstance = new Header_nav(params)
        if (!header_navInstance.save(flush: true)) {
            render(view: "create", model: [header_navInstance: header_navInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'header_nav.label', default: 'Header_nav'), header_navInstance.id])
        redirect(action: "show", id: header_navInstance.id)
    }

    def show() {
        def header_navInstance = Header_nav.get(params.id)
        if (!header_navInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_nav.label', default: 'Header_nav'), params.id])
            redirect(action: "list")
            return
        }

        [header_navInstance: header_navInstance]
    }

    def edit() {
        def header_navInstance = Header_nav.get(params.id)
        if (!header_navInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_nav.label', default: 'Header_nav'), params.id])
            redirect(action: "list")
            return
        }

        [header_navInstance: header_navInstance]
    }

    def update() {
        def header_navInstance = Header_nav.get(params.id)
        if (!header_navInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_nav.label', default: 'Header_nav'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (header_navInstance.version > version) {
                header_navInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'header_nav.label', default: 'Header_nav')] as Object[],
                          "Another user has updated this Header_nav while you were editing")
                render(view: "edit", model: [header_navInstance: header_navInstance])
                return
            }
        }

        header_navInstance.properties = params

        if (!header_navInstance.save(flush: true)) {
            render(view: "edit", model: [header_navInstance: header_navInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'header_nav.label', default: 'Header_nav'), header_navInstance.id])
        redirect(action: "show", id: header_navInstance.id)
    }

    def delete() {
        def header_navInstance = Header_nav.get(params.id)
        if (!header_navInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_nav.label', default: 'Header_nav'), params.id])
            redirect(action: "list")
            return
        }

        try {
            header_navInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'header_nav.label', default: 'Header_nav'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'header_nav.label', default: 'Header_nav'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
