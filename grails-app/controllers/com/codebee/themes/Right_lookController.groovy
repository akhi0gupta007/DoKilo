package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Right_lookController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [right_lookInstanceList: Right_look.list(params), right_lookInstanceTotal: Right_look.count()]
    }

    def create() {
        [right_lookInstance: new Right_look(params)]
    }

    def save() {
        def right_lookInstance = new Right_look(params)
        if (!right_lookInstance.save(flush: true)) {
            render(view: "create", model: [right_lookInstance: right_lookInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'right_look.label', default: 'Right_look'), right_lookInstance.id])
        redirect(action: "show", id: right_lookInstance.id)
    }

    def show() {
        def right_lookInstance = Right_look.get(params.id)
        if (!right_lookInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_look.label', default: 'Right_look'), params.id])
            redirect(action: "list")
            return
        }

        [right_lookInstance: right_lookInstance]
    }

    def edit() {
        def right_lookInstance = Right_look.get(params.id)
        if (!right_lookInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_look.label', default: 'Right_look'), params.id])
            redirect(action: "list")
            return
        }

        [right_lookInstance: right_lookInstance]
    }

    def update() {
        def right_lookInstance = Right_look.get(params.id)
        if (!right_lookInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_look.label', default: 'Right_look'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (right_lookInstance.version > version) {
                right_lookInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'right_look.label', default: 'Right_look')] as Object[],
                          "Another user has updated this Right_look while you were editing")
                render(view: "edit", model: [right_lookInstance: right_lookInstance])
                return
            }
        }

        right_lookInstance.properties = params

        if (!right_lookInstance.save(flush: true)) {
            render(view: "edit", model: [right_lookInstance: right_lookInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'right_look.label', default: 'Right_look'), right_lookInstance.id])
        redirect(action: "show", id: right_lookInstance.id)
    }

    def delete() {
        def right_lookInstance = Right_look.get(params.id)
        if (!right_lookInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_look.label', default: 'Right_look'), params.id])
            redirect(action: "list")
            return
        }

        try {
            right_lookInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'right_look.label', default: 'Right_look'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'right_look.label', default: 'Right_look'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
