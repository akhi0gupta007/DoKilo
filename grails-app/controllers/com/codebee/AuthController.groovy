package com.codebee
import grails.converters.JSON
class AuthController {
	def TokenGeneratorService
    def index() {
		render "<H2>Unauthorised</h2>"
		 }
	
	def authUser() {
       // log.info "reached here for auth service ........${params.userId.getClass()}"
		def result = []
		Object key
		boolean status = false
		def token = User.findByUserId(params.userId);
			if(token){
					if(token.password.equals(params.password))
						status = true
					else
						status = false
			}
		long val
			if(status){
				key=TokenGeneratorService.getToken()
				val=token.id
			}
			else{
				val=0
				key="N/A"
			}


		if(status)    {
            session["user"] = token
            flash.message = "Welcome ${token.userId} !"
            redirect(url: "/user/home")
        }
        else   {
            flash.message = "Wrong Credentials"
            redirect(controller: "persistence",action: "wrong")
        }

		//result=[loggedin:status,token:key,userid:val]
		//render result as JSON
		}


    def authUser1() {
        log.info "reached here for auth service ........${params.userId.getClass()}"
        def result = []
        Object key
        boolean status = false
        def token = User.findByUserId(params.userId);
        if(token){
            if(token.password.equals(params.password))
                status = true
            else
                status = false
        }
        long val
        if(status){
            key=TokenGeneratorService.getToken()
            val=token.id
        }
        else{
            val=0
            key="N/A"
        }
        session["user"] = token

        if(status)
            render "Success"
        else
            render "Failure"
        //result=[loggedin:status,token:key,userid:val]
        //render result as JSON
    }
}
