package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException

class ProTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [proTypeInstanceList: ProType.list(params), proTypeInstanceTotal: ProType.count()]
    }

    def create() {
        [proTypeInstance: new ProType(params)]
    }

    def save() {
        def proTypeInstance = new ProType(params)
        if (!proTypeInstance.save(flush: true)) {
            render(view: "create", model: [proTypeInstance: proTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'proType.label', default: 'ProType'), proTypeInstance.id])
        redirect(action: "show", id: proTypeInstance.id)
    }

    def show() {
        def proTypeInstance = ProType.get(params.id)
        if (!proTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'proType.label', default: 'ProType'), params.id])
            redirect(action: "list")
            return
        }

        [proTypeInstance: proTypeInstance]
    }

    def edit() {
        def proTypeInstance = ProType.get(params.id)
        if (!proTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proType.label', default: 'ProType'), params.id])
            redirect(action: "list")
            return
        }

        [proTypeInstance: proTypeInstance]
    }

    def update() {
        def proTypeInstance = ProType.get(params.id)
        if (!proTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proType.label', default: 'ProType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (proTypeInstance.version > version) {
                proTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'proType.label', default: 'ProType')] as Object[],
                          "Another user has updated this ProType while you were editing")
                render(view: "edit", model: [proTypeInstance: proTypeInstance])
                return
            }
        }

        proTypeInstance.properties = params

        if (!proTypeInstance.save(flush: true)) {
            render(view: "edit", model: [proTypeInstance: proTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'proType.label', default: 'ProType'), proTypeInstance.id])
        redirect(action: "show", id: proTypeInstance.id)
    }

    def delete() {
        def proTypeInstance = ProType.get(params.id)
        if (!proTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'proType.label', default: 'ProType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            proTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'proType.label', default: 'ProType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'proType.label', default: 'ProType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
