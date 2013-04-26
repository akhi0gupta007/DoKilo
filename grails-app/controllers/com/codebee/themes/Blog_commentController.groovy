package com.codebee.themes

import org.springframework.dao.DataIntegrityViolationException

class Blog_commentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [blog_commentInstanceList: Blog_comment.list(params), blog_commentInstanceTotal: Blog_comment.count()]
    }

    def create() {
        [blog_commentInstance: new Blog_comment(params)]
    }

    def save() {
        def blog_commentInstance = new Blog_comment(params)
        if (!blog_commentInstance.save(flush: true)) {
            render(view: "create", model: [blog_commentInstance: blog_commentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'blog_comment.label', default: 'Blog_comment'), blog_commentInstance.id])
        redirect(action: "show", id: blog_commentInstance.id)
    }

    def show() {
        def blog_commentInstance = Blog_comment.get(params.id)
        if (!blog_commentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog_comment.label', default: 'Blog_comment'), params.id])
            redirect(action: "list")
            return
        }

        [blog_commentInstance: blog_commentInstance]
    }

    def edit() {
        def blog_commentInstance = Blog_comment.get(params.id)
        if (!blog_commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog_comment.label', default: 'Blog_comment'), params.id])
            redirect(action: "list")
            return
        }

        [blog_commentInstance: blog_commentInstance]
    }

    def update() {
        def blog_commentInstance = Blog_comment.get(params.id)
        if (!blog_commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog_comment.label', default: 'Blog_comment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (blog_commentInstance.version > version) {
                blog_commentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'blog_comment.label', default: 'Blog_comment')] as Object[],
                          "Another user has updated this Blog_comment while you were editing")
                render(view: "edit", model: [blog_commentInstance: blog_commentInstance])
                return
            }
        }

        blog_commentInstance.properties = params

        if (!blog_commentInstance.save(flush: true)) {
            render(view: "edit", model: [blog_commentInstance: blog_commentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'blog_comment.label', default: 'Blog_comment'), blog_commentInstance.id])
        redirect(action: "show", id: blog_commentInstance.id)
    }

    def delete() {
        def blog_commentInstance = Blog_comment.get(params.id)
        if (!blog_commentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog_comment.label', default: 'Blog_comment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            blog_commentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'blog_comment.label', default: 'Blog_comment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'blog_comment.label', default: 'Blog_comment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
