package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Gen_fontsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [gen_fontsInstanceList: Gen_fonts.list(params), gen_fontsInstanceTotal: Gen_fonts.count()]
    }

    def create() {
        [gen_fontsInstance: new Gen_fonts(params)]
    }

    def save() {
        def gen_fontsInstance = new Gen_fonts(params)
        if (!gen_fontsInstance.save(flush: true)) {
            render(view: "create", model: [gen_fontsInstance: gen_fontsInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'gen_fonts.label', default: 'Gen_fonts'), gen_fontsInstance.id])
        redirect(action: "show", id: gen_fontsInstance.id)
    }

    def show() {
        def gen_fontsInstance = Gen_fonts.get(params.id)
        if (!gen_fontsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_fonts.label', default: 'Gen_fonts'), params.id])
            redirect(action: "list")
            return
        }

        [gen_fontsInstance: gen_fontsInstance]
    }

    def edit() {
        def gen_fontsInstance = Gen_fonts.get(params.id)
        if (!gen_fontsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_fonts.label', default: 'Gen_fonts'), params.id])
            redirect(action: "list")
            return
        }

        [gen_fontsInstance: gen_fontsInstance]
    }

    def update() {
        def gen_fontsInstance = Gen_fonts.get(params.id)
        if (!gen_fontsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_fonts.label', default: 'Gen_fonts'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (gen_fontsInstance.version > version) {
                gen_fontsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gen_fonts.label', default: 'Gen_fonts')] as Object[],
                          "Another user has updated this Gen_fonts while you were editing")
                render(view: "edit", model: [gen_fontsInstance: gen_fontsInstance])
                return
            }
        }

        gen_fontsInstance.properties = params

        if (!gen_fontsInstance.save(flush: true)) {
            render(view: "edit", model: [gen_fontsInstance: gen_fontsInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'gen_fonts.label', default: 'Gen_fonts'), gen_fontsInstance.id])
        redirect(action: "show", id: gen_fontsInstance.id)
    }

    def delete() {
        def gen_fontsInstance = Gen_fonts.get(params.id)
        if (!gen_fontsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gen_fonts.label', default: 'Gen_fonts'), params.id])
            redirect(action: "list")
            return
        }

        try {
            gen_fontsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'gen_fonts.label', default: 'Gen_fonts'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gen_fonts.label', default: 'Gen_fonts'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
