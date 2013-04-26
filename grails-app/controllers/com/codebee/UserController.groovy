package com.codebee

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.*

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def tryjs(){


	Map list = ["data":"{'name':'akhilesh','password':'hihello'}"]

	def jsonString = (list as JSON).toString()


	Map parsedList = JSON.parse(jsonString)

	def another = parsedList.data

	//	def x = (another as JSON).toString()

	Map xparsedList = JSON.parse(another)

	render another as JSON

    }

    def demo(){



	def jsonObject = request.JSON
	log.warn "User agent: " +  jsonObject


	def data = JSON.parse(jsonObject.toString())
	def send = [auth:"true"]
	render send as JSON
    }

    def home(){
    }
    def addUser(){
	def result = []
	def status
	def errors = []
	try{

	    String output
	    if(params.u && params.p && params.em) {
		def user=new com.codebee.User(userId:params.u,password:params.p,emailId:params.em)
		user.save()
		if(user.hasErrors()) {
		    //def errors = user.errors
		    if (user.errors.hasFieldErrors("password")){
			//log.info("wtf")
			//log.info("Password : "+user.errors.hasFieldErrors("password"))
			errors.add("Password must be more than 6-12 character<br>")
		    }
		    if (user.errors.hasFieldErrors("password")){
			errors.add('Userid Must be unique and more than 3 character<br>')
		    }
		    if (user.errors.hasFieldErrors("emailId")){
			errors.add('Enter unique and valid EmailId')
		    }
		    user.errors.allErrors.each {
			//errors.add(it)
			// print it.defaultMessage
		    }
		    // log.info ("Errorrrrr" +  errors);
		    status = 0
		}else{
		    status=1
		}
		result = [result:status,token:user.id,userId:user.userId,password:user.password]
	    }else{
		status=0
		result = [result:"Incorrect Parameters"]
	    }
	}catch(Exception ex){
	    ex.getMessage();
	}
	if(status == 1)
	{
	    flash.message = "${params.u} Successfully Registered"
	    redirect(controller: "persistence",action: "logout2")

	}  else{

	    log.info("Sending ${errors}")
	    //redirect(controller: "persistence",action: "errorMsg",params: [errors:errors])
	    flash.message = "Error in registering :<br> ${errors}"
	    redirect(url: "/")

	}

    }


    def index() {
	redirect(action: "list", params: params)
    }

    def list() {
	params.max = Math.min(params.max ? params.int('max') : 10, 100)
	[userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
	[userInstance: new User(params)]
    }

    def save() {
	def userInstance = new User(params)
	if (!userInstance.save(flush: true)) {
	    render(view: "create", model: [userInstance: userInstance])
	    return
	}

	flash.message = message(code: 'default.created.message', args: [
	    message(code: 'user.label', default: 'User'),
	    userInstance.id
	])
	redirect(action: "show", id: userInstance.id)
    }

    def show() {
	def userInstance = User.get(params.id)
	if (!userInstance) {
	    flash.message = message(code: 'default.not.found.message', args: [
		message(code: 'user.label', default: 'User'),
		params.id
	    ])
	    redirect(action: "list")
	    return
	}

	[userInstance: userInstance]
    }

    def edit() {
	def userInstance = User.get(params.id)
	if (!userInstance) {
	    flash.message = message(code: 'default.not.found.message', args: [
		message(code: 'user.label', default: 'User'),
		params.id
	    ])
	    redirect(action: "list")
	    return
	}

	[userInstance: userInstance]
    }

    def update() {
	def userInstance = User.get(params.id)
	if (!userInstance) {
	    flash.message = message(code: 'default.not.found.message', args: [
		message(code: 'user.label', default: 'User'),
		params.id
	    ])
	    redirect(action: "list")
	    return
	}

	if (params.version) {
	    def version = params.version.toLong()
	    if (userInstance.version > version) {
		userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
			[
			    message(code: 'user.label', default: 'User')] as Object[],
			"Another user has updated this User while you were editing")
		render(view: "edit", model: [userInstance: userInstance])
		return
	    }
	}

	userInstance.properties = params

	if (!userInstance.save(flush: true)) {
	    render(view: "edit", model: [userInstance: userInstance])
	    return
	}

	flash.message = message(code: 'default.updated.message', args: [
	    message(code: 'user.label', default: 'User'),
	    userInstance.id
	])
	redirect(action: "show", id: userInstance.id)
    }

    def delete() {
	def userInstance = User.get(params.id)
	if (!userInstance) {
	    flash.message = message(code: 'default.not.found.message', args: [
		message(code: 'user.label', default: 'User'),
		params.id
	    ])
	    redirect(action: "list")
	    return
	}

	try {
	    userInstance.delete(flush: true)
	    flash.message = message(code: 'default.deleted.message', args: [
		message(code: 'user.label', default: 'User'),
		params.id
	    ])
	    redirect(action: "list")
	}
	catch (DataIntegrityViolationException e) {
	    flash.message = message(code: 'default.not.deleted.message', args: [
		message(code: 'user.label', default: 'User'),
		params.id
	    ])
	    redirect(action: "show", id: params.id)
	}
    }
}
