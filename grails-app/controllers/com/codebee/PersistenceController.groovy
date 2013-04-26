package com.codebee
import grails.converters.JSON
class PersistenceController {

    def index() {
		def result = []
		def val=session["token"]
		def i=session["val"]
		def login1=session["login"]
		result=[token:val,userid:i,login:login1]
		render result as JSON
		 }
	
		def logout(){
			session.invalidate()
			redirect(url: "/")
			}

    def logout2(){
        flash.message = "Successfully Registered"
        redirect(url: "/")
    }

    def wrong(){
        flash.message = "Wrong Credentials"
        redirect(url: "/")
    }

    def invalid(){
        flash.message = "Invalid URL"
        redirect(url: "/")
    }

    def errorMsg(){
    if (params.errors){
        flash.message = "${params.error}"
        redirect(url: "/")
    }
    }
		def protectedDemo(){
			def val=session["token"]
			String my=session["val"]
			if((my.equals(params.id))&&(session["token"].equals(params.token)))
			render "<h2>I am protected and id is ${params.id} and session token is ${val} and my token is ${params.token} and ${my} </h2>"
			else
			render "<h2>Invalid User</h2>"
			}	
		
}
