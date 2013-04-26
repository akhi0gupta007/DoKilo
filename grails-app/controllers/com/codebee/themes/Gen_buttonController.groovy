package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Gen_buttonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [gen_buttonInstanceList: Gen_button.list(params), gen_buttonInstanceTotal: Gen_button.count()]
    }

    def create() {
        [gen_buttonInstance: new Gen_button(params)]
    }

    def save() {
        def gen_buttonInstance = new Gen_button(params)
        if (!gen_buttonInstance.save(flush: true)) {
            render(view: "create", model: [gen_buttonInstance: gen_buttonInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'gen_button.label', default: 'Gen_button'), gen_buttonInstance.id])
        redirect(action: "show", id: gen_buttonInstance.id)
    }

    def show() {
        def gen_buttonInstance = Gen_button.get(params.id)
        if (!gen_buttonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_button.label', default: 'Gen_button'), params.id])
            redirect(action: "list")
            return
        }

        [gen_buttonInstance: gen_buttonInstance]
    }

    def edit() {
        def gen_buttonInstance = Gen_button.get(params.id)
        if (!gen_buttonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_button.label', default: 'Gen_button'), params.id])
            redirect(action: "list")
            return
        }

        [gen_buttonInstance: gen_buttonInstance]
    }

    def update() {
        def gen_buttonInstance = Gen_button.get(params.id)
        if (!gen_buttonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_button.label', default: 'Gen_button'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (gen_buttonInstance.version > version) {
                gen_buttonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gen_button.label', default: 'Gen_button')] as Object[],
                          "Another user has updated this Gen_button while you were editing")
                render(view: "edit", model: [gen_buttonInstance: gen_buttonInstance])
                return
            }
        }

        gen_buttonInstance.properties = params

        if (!gen_buttonInstance.save(flush: true)) {
            render(view: "edit", model: [gen_buttonInstance: gen_buttonInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'gen_button.label', default: 'Gen_button'), gen_buttonInstance.id])
        redirect(action: "show", id: gen_buttonInstance.id)
    }

    def delete() {
        def gen_buttonInstance = Gen_button.get(params.id)
        if (!gen_buttonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_button.label', default: 'Gen_button'), params.id])
            redirect(action: "list")
            return
        }

        try {
            gen_buttonInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'gen_button.label', default: 'Gen_button'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gen_button.label', default: 'Gen_button'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
