package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Gen_contentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [gen_contentInstanceList: Gen_content.list(params), gen_contentInstanceTotal: Gen_content.count()]
    }

    def create() {
        [gen_contentInstance: new Gen_content(params)]
    }

    def save() {
        def gen_contentInstance = new Gen_content(params)
        if (!gen_contentInstance.save(flush: true)) {
            render(view: "create", model: [gen_contentInstance: gen_contentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'gen_content.label', default: 'Gen_content'), gen_contentInstance.id])
        redirect(action: "show", id: gen_contentInstance.id)
    }

    def show() {
        def gen_contentInstance = Gen_content.get(params.id)
        if (!gen_contentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_content.label', default: 'Gen_content'), params.id])
            redirect(action: "list")
            return
        }

        [gen_contentInstance: gen_contentInstance]
    }

    def edit() {
        def gen_contentInstance = Gen_content.get(params.id)
        if (!gen_contentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_content.label', default: 'Gen_content'), params.id])
            redirect(action: "list")
            return
        }

        [gen_contentInstance: gen_contentInstance]
    }

    def update() {
        def gen_contentInstance = Gen_content.get(params.id)
        if (!gen_contentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_content.label', default: 'Gen_content'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (gen_contentInstance.version > version) {
                gen_contentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gen_content.label', default: 'Gen_content')] as Object[],
                          "Another user has updated this Gen_content while you were editing")
                render(view: "edit", model: [gen_contentInstance: gen_contentInstance])
                return
            }
        }

        gen_contentInstance.properties = params

        if (!gen_contentInstance.save(flush: true)) {
            render(view: "edit", model: [gen_contentInstance: gen_contentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'gen_content.label', default: 'Gen_content'), gen_contentInstance.id])
        redirect(action: "show", id: gen_contentInstance.id)
    }

    def delete() {
        def gen_contentInstance = Gen_content.get(params.id)
        if (!gen_contentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_content.label', default: 'Gen_content'), params.id])
            redirect(action: "list")
            return
        }

        try {
            gen_contentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'gen_content.label', default: 'Gen_content'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gen_content.label', default: 'Gen_content'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
