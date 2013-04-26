package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException

class SubSubCollectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [subSubCollectionInstanceList: SubSubCollection.list(params), subSubCollectionInstanceTotal: SubSubCollection.count()]
    }

    def create() {
        [subSubCollectionInstance: new SubSubCollection(params)]
    }

    def save() {
        def subSubCollectionInstance = new SubSubCollection(params)
        if (!subSubCollectionInstance.save(flush: true)) {
            render(view: "create", model: [subSubCollectionInstance: subSubCollectionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'subSubCollection.label', default: 'SubSubCollection'), subSubCollectionInstance.id])
        redirect(action: "show", id: subSubCollectionInstance.id)
    }

    def show() {
        def subSubCollectionInstance = SubSubCollection.get(params.id)
        if (!subSubCollectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subSubCollection.label', default: 'SubSubCollection'), params.id])
            redirect(action: "list")
            return
        }

        [subSubCollectionInstance: subSubCollectionInstance]
    }

    def edit() {
        def subSubCollectionInstance = SubSubCollection.get(params.id)
        if (!subSubCollectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subSubCollection.label', default: 'SubSubCollection'), params.id])
            redirect(action: "list")
            return
        }

        [subSubCollectionInstance: subSubCollectionInstance]
    }

    def update() {
        def subSubCollectionInstance = SubSubCollection.get(params.id)
        if (!subSubCollectionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subSubCollection.label', default: 'SubSubCollection'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (subSubCollectionInstance.version > version) {
                subSubCollectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subSubCollection.label', default: 'SubSubCollection')] as Object[],
                          "Another user has updated this SubSubCollection while you were editing")
                render(view: "edit", model: [subSubCollectionInstance: subSubCollectionInstance])
                return
            }
        }

        subSubCollectionInstance.properties = params

        if (!subSubCollectionInstance.save(flush: true)) {
            render(view: "edit", model: [subSubCollectionInstance: subSubCollectionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'subSubCollection.label', default: 'SubSubCollection'), subSubCollectionInstance.id])
        redirect(action: "show", id: subSubCollectionInstance.id)
    }

    def delete() {
        def subSubCollectionInstance = SubSubCollection.get(params.id)
        if (!subSubCollectionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subSubCollection.label', default: 'SubSubCollection'), params.id])
            redirect(action: "list")
            return
        }

        try {
            subSubCollectionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'subSubCollection.label', default: 'SubSubCollection'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subSubCollection.label', default: 'SubSubCollection'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
