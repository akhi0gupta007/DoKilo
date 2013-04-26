package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException

class SubCollectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [subCollectionInstanceList: SubCollection.list(params), subCollectionInstanceTotal: SubCollection.count()]
    }

    def create() {
        [subCollectionInstance: new SubCollection(params)]
    }

    def save() {
        def subCollectionInstance = new SubCollection(params)
        if (!subCollectionInstance.save(flush: true)) {
            render(view: "create", model: [subCollectionInstance: subCollectionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'subCollection.label', default: 'SubCollection'), subCollectionInstance.id])
        redirect(action: "show", id: subCollectionInstance.id)
    }

    def show() {
        def subCollectionInstance = SubCollection.get(params.id)
        if (!subCollectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCollection.label', default: 'SubCollection'), params.id])
            redirect(action: "list")
            return
        }

        [subCollectionInstance: subCollectionInstance]
    }

    def edit() {
        def subCollectionInstance = SubCollection.get(params.id)
        if (!subCollectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCollection.label', default: 'SubCollection'), params.id])
            redirect(action: "list")
            return
        }

        [subCollectionInstance: subCollectionInstance]
    }

    def update() {
        def subCollectionInstance = SubCollection.get(params.id)
        if (!subCollectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCollection.label', default: 'SubCollection'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (subCollectionInstance.version > version) {
                subCollectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subCollection.label', default: 'SubCollection')] as Object[],
                          "Another user has updated this SubCollection while you were editing")
                render(view: "edit", model: [subCollectionInstance: subCollectionInstance])
                return
            }
        }

        subCollectionInstance.properties = params

        if (!subCollectionInstance.save(flush: true)) {
            render(view: "edit", model: [subCollectionInstance: subCollectionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'subCollection.label', default: 'SubCollection'), subCollectionInstance.id])
        redirect(action: "show", id: subCollectionInstance.id)
    }

    def delete() {
        def subCollectionInstance = SubCollection.get(params.id)
        if (!subCollectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCollection.label', default: 'SubCollection'), params.id])
            redirect(action: "list")
            return
        }

        try {
            subCollectionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'subCollection.label', default: 'SubCollection'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subCollection.label', default: 'SubCollection'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
