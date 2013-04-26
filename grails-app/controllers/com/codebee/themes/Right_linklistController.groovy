package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Right_linklistController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [right_linklistInstanceList: Right_linklist.list(params), right_linklistInstanceTotal: Right_linklist.count()]
    }

    def create() {
        [right_linklistInstance: new Right_linklist(params)]
    }

    def save() {
        def right_linklistInstance = new Right_linklist(params)
        if (!right_linklistInstance.save(flush: true)) {
            render(view: "create", model: [right_linklistInstance: right_linklistInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'right_linklist.label', default: 'Right_linklist'), right_linklistInstance.id])
        redirect(action: "show", id: right_linklistInstance.id)
    }

    def show() {
        def right_linklistInstance = Right_linklist.get(params.id)
        if (!right_linklistInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_linklist.label', default: 'Right_linklist'), params.id])
            redirect(action: "list")
            return
        }

        [right_linklistInstance: right_linklistInstance]
    }

    def edit() {
        def right_linklistInstance = Right_linklist.get(params.id)
        if (!right_linklistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_linklist.label', default: 'Right_linklist'), params.id])
            redirect(action: "list")
            return
        }

        [right_linklistInstance: right_linklistInstance]
    }

    def update() {
        def right_linklistInstance = Right_linklist.get(params.id)
        if (!right_linklistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_linklist.label', default: 'Right_linklist'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (right_linklistInstance.version > version) {
                right_linklistInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'right_linklist.label', default: 'Right_linklist')] as Object[],
                          "Another user has updated this Right_linklist while you were editing")
                render(view: "edit", model: [right_linklistInstance: right_linklistInstance])
                return
            }
        }

        right_linklistInstance.properties = params

        if (!right_linklistInstance.save(flush: true)) {
            render(view: "edit", model: [right_linklistInstance: right_linklistInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'right_linklist.label', default: 'Right_linklist'), right_linklistInstance.id])
        redirect(action: "show", id: right_linklistInstance.id)
    }

    def delete() {
        def right_linklistInstance = Right_linklist.get(params.id)
        if (!right_linklistInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_linklist.label', default: 'Right_linklist'), params.id])
            redirect(action: "list")
            return
        }

        try {
            right_linklistInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'right_linklist.label', default: 'Right_linklist'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'right_linklist.label', default: 'Right_linklist'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
