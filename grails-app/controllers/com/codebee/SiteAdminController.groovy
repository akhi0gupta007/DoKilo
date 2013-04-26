package com.codebee

import org.springframework.dao.DataIntegrityViolationException

class SiteAdminController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [siteAdminInstanceList: SiteAdmin.list(params), siteAdminInstanceTotal: SiteAdmin.count()]
    }

    def create() {
        [siteAdminInstance: new SiteAdmin(params)]
    }

    def save() {
        def siteAdminInstance = new SiteAdmin(params)
        if (!siteAdminInstance.save(flush: true)) {
            render(view: "create", model: [siteAdminInstance: siteAdminInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), siteAdminInstance.id])
        redirect(action: "show", id: siteAdminInstance.id)
    }

    def show() {
        def siteAdminInstance = SiteAdmin.get(params.id)
        if (!siteAdminInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), params.id])
            redirect(action: "list")
            return
        }

        [siteAdminInstance: siteAdminInstance]
    }

    def edit() {
        def siteAdminInstance = SiteAdmin.get(params.id)
        if (!siteAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), params.id])
            redirect(action: "list")
            return
        }

        [siteAdminInstance: siteAdminInstance]
    }

    def update() {
        def siteAdminInstance = SiteAdmin.get(params.id)
        if (!siteAdminInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (siteAdminInstance.version > version) {
                siteAdminInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'siteAdmin.label', default: 'SiteAdmin')] as Object[],
                          "Another user has updated this SiteAdmin while you were editing")
                render(view: "edit", model: [siteAdminInstance: siteAdminInstance])
                return
            }
        }

        siteAdminInstance.properties = params

        if (!siteAdminInstance.save(flush: true)) {
            render(view: "edit", model: [siteAdminInstance: siteAdminInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), siteAdminInstance.id])
        redirect(action: "show", id: siteAdminInstance.id)
    }

    def delete() {
        def siteAdminInstance = SiteAdmin.get(params.id)
        if (!siteAdminInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), params.id])
            redirect(action: "list")
            return
        }

        try {
            siteAdminInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'siteAdmin.label', default: 'SiteAdmin'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
