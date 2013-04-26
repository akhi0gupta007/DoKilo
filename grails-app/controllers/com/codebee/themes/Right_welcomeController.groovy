package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Right_welcomeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [right_welcomeInstanceList: Right_welcome.list(params), right_welcomeInstanceTotal: Right_welcome.count()]
    }

    def create() {
        [right_welcomeInstance: new Right_welcome(params)]
    }

    def save() {
        def right_welcomeInstance = new Right_welcome(params)
        if (!right_welcomeInstance.save(flush: true)) {
            render(view: "create", model: [right_welcomeInstance: right_welcomeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'right_welcome.label', default: 'Right_welcome'), right_welcomeInstance.id])
        redirect(action: "show", id: right_welcomeInstance.id)
    }

    def show() {
        def right_welcomeInstance = Right_welcome.get(params.id)
        if (!right_welcomeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_welcome.label', default: 'Right_welcome'), params.id])
            redirect(action: "list")
            return
        }

        [right_welcomeInstance: right_welcomeInstance]
    }

    def edit() {
        def right_welcomeInstance = Right_welcome.get(params.id)
        if (!right_welcomeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_welcome.label', default: 'Right_welcome'), params.id])
            redirect(action: "list")
            return
        }

        [right_welcomeInstance: right_welcomeInstance]
    }

    def update() {
        def right_welcomeInstance = Right_welcome.get(params.id)
        if (!right_welcomeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_welcome.label', default: 'Right_welcome'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (right_welcomeInstance.version > version) {
                right_welcomeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'right_welcome.label', default: 'Right_welcome')] as Object[],
                          "Another user has updated this Right_welcome while you were editing")
                render(view: "edit", model: [right_welcomeInstance: right_welcomeInstance])
                return
            }
        }

        right_welcomeInstance.properties = params

        if (!right_welcomeInstance.save(flush: true)) {
            render(view: "edit", model: [right_welcomeInstance: right_welcomeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'right_welcome.label', default: 'Right_welcome'), right_welcomeInstance.id])
        redirect(action: "show", id: right_welcomeInstance.id)
    }

    def delete() {
        def right_welcomeInstance = Right_welcome.get(params.id)
        if (!right_welcomeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_welcome.label', default: 'Right_welcome'), params.id])
            redirect(action: "list")
            return
        }

        try {
            right_welcomeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'right_welcome.label', default: 'Right_welcome'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'right_welcome.label', default: 'Right_welcome'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
