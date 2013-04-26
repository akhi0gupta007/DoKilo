package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException

class CustomVariantController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [customVariantInstanceList: CustomVariant.list(params), customVariantInstanceTotal: CustomVariant.count()]
    }

    def create() {
        [customVariantInstance: new CustomVariant(params)]
    }

    def save() {
        def customVariantInstance = new CustomVariant(params)
        if (!customVariantInstance.save(flush: true)) {
            render(view: "create", model: [customVariantInstance: customVariantInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'customVariant.label', default: 'CustomVariant'), customVariantInstance.id])
        redirect(action: "show", id: customVariantInstance.id)
    }

    def show() {
        def customVariantInstance = CustomVariant.get(params.id)
        if (!customVariantInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customVariant.label', default: 'CustomVariant'), params.id])
            redirect(action: "list")
            return
        }

        [customVariantInstance: customVariantInstance]
    }

    def edit() {
        def customVariantInstance = CustomVariant.get(params.id)
        if (!customVariantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customVariant.label', default: 'CustomVariant'), params.id])
            redirect(action: "list")
            return
        }

        [customVariantInstance: customVariantInstance]
    }

    def update() {
        def customVariantInstance = CustomVariant.get(params.id)
        if (!customVariantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customVariant.label', default: 'CustomVariant'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (customVariantInstance.version > version) {
                customVariantInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customVariant.label', default: 'CustomVariant')] as Object[],
                          "Another user has updated this CustomVariant while you were editing")
                render(view: "edit", model: [customVariantInstance: customVariantInstance])
                return
            }
        }

        customVariantInstance.properties = params

        if (!customVariantInstance.save(flush: true)) {
            render(view: "edit", model: [customVariantInstance: customVariantInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'customVariant.label', default: 'CustomVariant'), customVariantInstance.id])
        redirect(action: "show", id: customVariantInstance.id)
    }

    def delete() {
        def customVariantInstance = CustomVariant.get(params.id)
        if (!customVariantInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'customVariant.label', default: 'CustomVariant'), params.id])
            redirect(action: "list")
            return
        }

        try {
            customVariantInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'customVariant.label', default: 'CustomVariant'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customVariant.label', default: 'CustomVariant'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
