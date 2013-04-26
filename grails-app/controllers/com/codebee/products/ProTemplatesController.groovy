package com.codebee.products

import org.springframework.dao.DataIntegrityViolationException

class ProTemplatesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]



    def index() {
        //redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [proTemplatesInstanceList: ProTemplates.list(params), proTemplatesInstanceTotal: ProTemplates.count()]
    }

    def create() {
        [proTemplatesInstance: new ProTemplates(params)]
    }

    def save() {
        def user = session.user.attach()
        def proTemplates
        boolean pass,stat
        if (params.name){
             proTemplates = new ProTemplates(name:params.name,flag: 'N');

            if (params.attx instanceof String[]){

                for (int i=0;i<params.attx.length;i++){

                    if (params.attx[i] != null && params.attx[i] != ''){
                        def nameValuePair = new NameValuePair(name:params.attx[i]);
                        pass = nameValuePair.validate()
                        proTemplates.addToNameValuePair(nameValuePair)
                        pass = true
                    }

                }

            }else{
                if (params.attx != null && params.attx != ''){

                    def nameValuePair = new NameValuePair(name:params.attx);
                    pass = nameValuePair.validate()
                    proTemplates.addToNameValuePair(nameValuePair)
                    pass = true
                }

             }
            if (pass){
                user.addToProTemplates(proTemplates)
                user.save(flush: true)
                flash.message = "Created"

            }

        }
        redirect(controller: "product", action: "templates")

       // render "${params.attx.length} and valid ${proTemplates.validate()} and ${pass}"
    }

    def show() {
        def proTemplatesInstance = ProTemplates.get(params.id)
        if (!proTemplatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proTemplates.label', default: 'ProTemplates'), params.id])
            redirect(action: "list")
            return
        }

        [proTemplatesInstance: proTemplatesInstance]
    }

    def edit() {
        def proTemplatesInstance = ProTemplates.get(params.id)
        if (!proTemplatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proTemplates.label', default: 'ProTemplates'), params.id])
            redirect(action: "list")
            return
        }

        [proTemplatesInstance: proTemplatesInstance]
    }

    def update() {
        def proTemplatesInstance = ProTemplates.get(params.id)
        if (!proTemplatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proTemplates.label', default: 'ProTemplates'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (proTemplatesInstance.version > version) {
                proTemplatesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'proTemplates.label', default: 'ProTemplates')] as Object[],
                        "Another user has updated this ProTemplates while you were editing")
                render(view: "edit", model: [proTemplatesInstance: proTemplatesInstance])
                return
            }
        }

        proTemplatesInstance.properties = params

        if (!proTemplatesInstance.save(flush: true)) {
            render(view: "edit", model: [proTemplatesInstance: proTemplatesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'proTemplates.label', default: 'ProTemplates'), proTemplatesInstance.id])
        redirect(action: "show", id: proTemplatesInstance.id)
    }

    def delete() {
        def proTemplatesInstance = ProTemplates.get(params.id)
        if (!proTemplatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proTemplates.label', default: 'ProTemplates'), params.id])
            redirect(action: "list")
            return
        }

        try {
            proTemplatesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'proTemplates.label', default: 'ProTemplates'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'proTemplates.label', default: 'ProTemplates'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
