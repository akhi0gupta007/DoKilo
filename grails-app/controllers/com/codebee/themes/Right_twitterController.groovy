package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Right_twitterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [right_twitterInstanceList: Right_twitter.list(params), right_twitterInstanceTotal: Right_twitter.count()]
    }

    def create() {
        [right_twitterInstance: new Right_twitter(params)]
    }

    def save() {
        def right_twitterInstance = new Right_twitter(params)
        if (!right_twitterInstance.save(flush: true)) {
            render(view: "create", model: [right_twitterInstance: right_twitterInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'right_twitter.label', default: 'Right_twitter'), right_twitterInstance.id])
        redirect(action: "show", id: right_twitterInstance.id)
    }

    def show() {
        def right_twitterInstance = Right_twitter.get(params.id)
        if (!right_twitterInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_twitter.label', default: 'Right_twitter'), params.id])
            redirect(action: "list")
            return
        }

        [right_twitterInstance: right_twitterInstance]
    }

    def edit() {
        def right_twitterInstance = Right_twitter.get(params.id)
        if (!right_twitterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_twitter.label', default: 'Right_twitter'), params.id])
            redirect(action: "list")
            return
        }

        [right_twitterInstance: right_twitterInstance]
    }

    def update() {
        def right_twitterInstance = Right_twitter.get(params.id)
        if (!right_twitterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_twitter.label', default: 'Right_twitter'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (right_twitterInstance.version > version) {
                right_twitterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'right_twitter.label', default: 'Right_twitter')] as Object[],
                          "Another user has updated this Right_twitter while you were editing")
                render(view: "edit", model: [right_twitterInstance: right_twitterInstance])
                return
            }
        }

        right_twitterInstance.properties = params

        if (!right_twitterInstance.save(flush: true)) {
            render(view: "edit", model: [right_twitterInstance: right_twitterInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'right_twitter.label', default: 'Right_twitter'), right_twitterInstance.id])
        redirect(action: "show", id: right_twitterInstance.id)
    }

    def delete() {
        def right_twitterInstance = Right_twitter.get(params.id)
        if (!right_twitterInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'right_twitter.label', default: 'Right_twitter'), params.id])
            redirect(action: "list")
            return
        }

        try {
            right_twitterInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'right_twitter.label', default: 'Right_twitter'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'right_twitter.label', default: 'Right_twitter'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
