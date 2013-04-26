package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Page_backgroundController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [page_backgroundInstanceList: Page_background.list(params), page_backgroundInstanceTotal: Page_background.count()]
    }

    def create() {
        [page_backgroundInstance: new Page_background(params)]
    }

    def save() {
        def page_backgroundInstance = new Page_background(params)
        if (!page_backgroundInstance.save(flush: true)) {
            render(view: "create", model: [page_backgroundInstance: page_backgroundInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'page_background.label', default: 'Page_background'), page_backgroundInstance.id])
        redirect(action: "show", id: page_backgroundInstance.id)
    }

    def show() {
        def page_backgroundInstance = Page_background.get(params.id)
        if (!page_backgroundInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'page_background.label', default: 'Page_background'), params.id])
            redirect(action: "list")
            return
        }

        [page_backgroundInstance: page_backgroundInstance]
    }

    def edit() {
        def page_backgroundInstance = Page_background.get(params.id)
        if (!page_backgroundInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'page_background.label', default: 'Page_background'), params.id])
            redirect(action: "list")
            return
        }

        [page_backgroundInstance: page_backgroundInstance]
    }

    def update() {
        def page_backgroundInstance = Page_background.get(params.id)
        if (!page_backgroundInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'page_background.label', default: 'Page_background'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (page_backgroundInstance.version > version) {
                page_backgroundInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'page_background.label', default: 'Page_background')] as Object[],
                          "Another user has updated this Page_background while you were editing")
                render(view: "edit", model: [page_backgroundInstance: page_backgroundInstance])
                return
            }
        }

        page_backgroundInstance.properties = params

        if (!page_backgroundInstance.save(flush: true)) {
            render(view: "edit", model: [page_backgroundInstance: page_backgroundInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'page_background.label', default: 'Page_background'), page_backgroundInstance.id])
        redirect(action: "show", id: page_backgroundInstance.id)
    }

    def delete() {
        def page_backgroundInstance = Page_background.get(params.id)
        if (!page_backgroundInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'page_background.label', default: 'Page_background'), params.id])
            redirect(action: "list")
            return
        }

        try {
            page_backgroundInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'page_background.label', default: 'Page_background'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'page_background.label', default: 'Page_background'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
