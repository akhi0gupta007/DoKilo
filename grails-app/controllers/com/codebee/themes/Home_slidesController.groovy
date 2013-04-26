package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Home_slidesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [home_slidesInstanceList: Home_slides.list(params), home_slidesInstanceTotal: Home_slides.count()]
    }

    def create() {
        [home_slidesInstance: new Home_slides(params)]
    }

    def save() {
        def home_slidesInstance = new Home_slides(params)
        if (!home_slidesInstance.save(flush: true)) {
            render(view: "create", model: [home_slidesInstance: home_slidesInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'home_slides.label', default: 'Home_slides'), home_slidesInstance.id])
        redirect(action: "show", id: home_slidesInstance.id)
    }

    def show() {
        def home_slidesInstance = Home_slides.get(params.id)
        if (!home_slidesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'home_slides.label', default: 'Home_slides'), params.id])
            redirect(action: "list")
            return
        }

        [home_slidesInstance: home_slidesInstance]
    }

    def edit() {
        def home_slidesInstance = Home_slides.get(params.id)
        if (!home_slidesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'home_slides.label', default: 'Home_slides'), params.id])
            redirect(action: "list")
            return
        }

        [home_slidesInstance: home_slidesInstance]
    }

    def update() {
        def home_slidesInstance = Home_slides.get(params.id)
        if (!home_slidesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'home_slides.label', default: 'Home_slides'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (home_slidesInstance.version > version) {
                home_slidesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'home_slides.label', default: 'Home_slides')] as Object[],
                          "Another user has updated this Home_slides while you were editing")
                render(view: "edit", model: [home_slidesInstance: home_slidesInstance])
                return
            }
        }

        home_slidesInstance.properties = params

        if (!home_slidesInstance.save(flush: true)) {
            render(view: "edit", model: [home_slidesInstance: home_slidesInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'home_slides.label', default: 'Home_slides'), home_slidesInstance.id])
        redirect(action: "show", id: home_slidesInstance.id)
    }

    def delete() {
        def home_slidesInstance = Home_slides.get(params.id)
        if (!home_slidesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'home_slides.label', default: 'Home_slides'), params.id])
            redirect(action: "list")
            return
        }

        try {
            home_slidesInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'home_slides.label', default: 'Home_slides'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'home_slides.label', default: 'Home_slides'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
