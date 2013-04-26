package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Header_searchController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [header_searchInstanceList: Header_search.list(params), header_searchInstanceTotal: Header_search.count()]
    }

    def create() {
        [header_searchInstance: new Header_search(params)]
    }

    def save() {
        def header_searchInstance = new Header_search(params)
        if (!header_searchInstance.save(flush: true)) {
            render(view: "create", model: [header_searchInstance: header_searchInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'header_search.label', default: 'Header_search'), header_searchInstance.id])
        redirect(action: "show", id: header_searchInstance.id)
    }

    def show() {
        def header_searchInstance = Header_search.get(params.id)
        if (!header_searchInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_search.label', default: 'Header_search'), params.id])
            redirect(action: "list")
            return
        }

        [header_searchInstance: header_searchInstance]
    }

    def edit() {
        def header_searchInstance = Header_search.get(params.id)
        if (!header_searchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_search.label', default: 'Header_search'), params.id])
            redirect(action: "list")
            return
        }

        [header_searchInstance: header_searchInstance]
    }

    def update() {
        def header_searchInstance = Header_search.get(params.id)
        if (!header_searchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_search.label', default: 'Header_search'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (header_searchInstance.version > version) {
                header_searchInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'header_search.label', default: 'Header_search')] as Object[],
                          "Another user has updated this Header_search while you were editing")
                render(view: "edit", model: [header_searchInstance: header_searchInstance])
                return
            }
        }

        header_searchInstance.properties = params

        if (!header_searchInstance.save(flush: true)) {
            render(view: "edit", model: [header_searchInstance: header_searchInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'header_search.label', default: 'Header_search'), header_searchInstance.id])
        redirect(action: "show", id: header_searchInstance.id)
    }

    def delete() {
        def header_searchInstance = Header_search.get(params.id)
        if (!header_searchInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'header_search.label', default: 'Header_search'), params.id])
            redirect(action: "list")
            return
        }

        try {
            header_searchInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'header_search.label', default: 'Header_search'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'header_search.label', default: 'Header_search'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
