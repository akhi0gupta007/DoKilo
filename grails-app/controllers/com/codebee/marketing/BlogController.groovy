package com.codebee.marketing

import org.springframework.dao.DataIntegrityViolationException

class BlogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def ajaxDelete = {

        def user = session.user.attach()
        def arr = user.blog
        def del
        def my =[]
        for (x in arr){
            if (x.id == Long.parseLong(params.id))     {
                del = x.attach()
                break
            }

        }
        log.info("the deleted object shall be"+del)
        user.blog.remove(del)
        del.delete(flush:true)
        user.save()
        flash.message = "Blog deleted"
        redirect(action: "index")

    }

    def make(){}
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        def user = session.user.attach()
        def list = user.blog

        [blogInstanceList: list]
    }

    def create() {
        [blogInstance: new Blog(params)]
    }

    def save() {
        def user = session.user.attach()
        def blogInstance = new Blog(params)
        user.addToBlog(blogInstance)
        if (!user.save(flush: true)) {


            render(view: "create", model: [blogInstance: blogInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'blog.label', default: 'Blog'), blogInstance.id])
        redirect(action: "show", id: blogInstance.id)
    }

    def show() {
        def blogInstance = Blog.get(params.id)
        if (!blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
            return
        }

        [blogInstance: blogInstance]
    }

    def edit() {
        def blogInstance = Blog.get(params.id)
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
            return
        }

        [blogInstance: blogInstance]
    }

    def update() {
        def blogInstance = Blog.get(params.id)
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (blogInstance.version > version) {
                blogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'blog.label', default: 'Blog')] as Object[],
                          "Another user has updated this Blog while you were editing")
                render(view: "edit", model: [blogInstance: blogInstance])
                return
            }
        }

        blogInstance.properties = params

        if (!blogInstance.save(flush: true)) {
            render(view: "edit", model: [blogInstance: blogInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'blog.label', default: 'Blog'), blogInstance.id])
        redirect(action: "show", id: blogInstance.id)
    }

    def delete() {
        def blogInstance = Blog.get(params.id)
        if (!blogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
            return
        }

        try {
            blogInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
