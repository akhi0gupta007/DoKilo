package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException

class SmartCollectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [smartCollectionInstanceList: SmartCollection.list(params), smartCollectionInstanceTotal: SmartCollection.count()]
    }

    def create() {
        [smartCollectionInstance: new SmartCollection(params)]
    }

    def save() {
        def smartCollectionInstance = new SmartCollection(params)
        if (!smartCollectionInstance.save(flush: true)) {
            render(view: "create", model: [smartCollectionInstance: smartCollectionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'smartCollection.label', default: 'SmartCollection'), smartCollectionInstance.id])
        redirect(action: "show", id: smartCollectionInstance.id)
    }

    def show() {
        def smartCollectionInstance = SmartCollection.get(params.id)
        if (!smartCollectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'smartCollection.label', default: 'SmartCollection'), params.id])
            redirect(action: "list")
            return
        }

        [smartCollectionInstance: smartCollectionInstance]
    }

    def edit() {
        def smartCollectionInstance = SmartCollection.get(params.id)
        if (!smartCollectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'smartCollection.label', default: 'SmartCollection'), params.id])
            redirect(action: "list")
            return
        }

        [smartCollectionInstance: smartCollectionInstance]
    }

    def update() {
        def smartCollectionInstance = SmartCollection.get(params.id)
        if (!smartCollectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'smartCollection.label', default: 'SmartCollection'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (smartCollectionInstance.version > version) {
                smartCollectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'smartCollection.label', default: 'SmartCollection')] as Object[],
                          "Another user has updated this SmartCollection while you were editing")
                render(view: "edit", model: [smartCollectionInstance: smartCollectionInstance])
                return
            }
        }

        smartCollectionInstance.properties = params

        if (!smartCollectionInstance.save(flush: true)) {
            render(view: "edit", model: [smartCollectionInstance: smartCollectionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'smartCollection.label', default: 'SmartCollection'), smartCollectionInstance.id])
        redirect(action: "show", id: smartCollectionInstance.id)
    }

    def delete() {
        def smartCollectionInstance = SmartCollection.get(params.id)
        if (!smartCollectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'smartCollection.label', default: 'SmartCollection'), params.id])
            redirect(action: "list")
            return
        }

        try {
            smartCollectionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'smartCollection.label', default: 'SmartCollection'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'smartCollection.label', default: 'SmartCollection'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
