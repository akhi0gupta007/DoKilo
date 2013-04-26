package com.codebee

import org.springframework.dao.DataIntegrityViolationException

class ProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {                      d
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [profileInstanceList: Profile.list(params), profileInstanceTotal: Profile.count()]
    }

    def domains(){
        def user = session.user.attach()
        def domain = user.domain
        [domain:domain]
    }
    
    def domainChange() {

        def user = session.user.attach()

        if (user && params.domain){
            user.domain = params.domain
            user.save(flush: true)
           flash.message = "Saved"
        }
        redirect(action: "domains")
    }

    def create() {
        def user = session.user.attach()
        def name
        def add
        def phone
        def mobile
        def expertise
        def purpose
        def country
        
        if (user && user.profile) {
            def profile =  user.profile
            name = profile.fullName
            add = profile.address
             purpose = profile.purpose

           mobile= profile.mobile
           phone=  profile.phone
            expertise=profile.expertise
            country=profile.country
        }
        [name:name,add:add,mobile:mobile,phone:phone,expertise:expertise,purpose:purpose,country:country]
    }

    def save() {
      def user = session.user.attach()
        def profile
        if (user){
           if (user.profile){

            profile = user.profile.attach()
            profile.address = params.address
            profile.fullName = params.fullName
            profile.mobile=params.mobile
            profile.phone = params.phone
            profile.expertise = params.expertise
            profile.country = params.country
            profile.purpose = params.purpose
            user.save()
               flash.message = "Profile Saved"
               redirect(action: "create")
           }else{
             profile = new Profile(params)
             user.profile = profile
             user.save(flush: true)

             log.info (profile.validate()) ;
             flash.message = "Profile Saved"
             redirect(action: "create")
           }
        }
        

    }

    def password(){

    }

   def passwordChange(){

       def errors
       def user = session.user.attach()
       
       if (user && params.old_password && params.new_password){
        
           if (user.password.equals(params.old_password)){
               
               user.password = params.new_password
               
               if (user.validate())
               {
                   user.save(flush: true)
                   flash.message = "Updated"

               }else{

                       log.info("BAD pASSWORD")
                       flash.message = "Error : ${errors}"
                       //log.info("Password : "+user.errors.hasFieldErrors("password"))
                       errors = "Password must be more than 6-12 character"

               }
           }else{
               log.info params.old_password.equals(user.password)
               log.info user.password
               flash.message = "Old Password is invalid"
           }
       }else{
              flash.message = "Invalid Parameters"
       }

       redirect(action: "password")
   }

    def show() {
        def profileInstance = Profile.get(params.id)
        if (!profileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
            redirect(action: "list")
            return
        }

        [profileInstance: profileInstance]
    }

    def edit() {
        def profileInstance = Profile.get(params.id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
            redirect(action: "list")
            return
        }

        [profileInstance: profileInstance]
    }

    def update() {
        def profileInstance = Profile.get(params.id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (profileInstance.version > version) {
                profileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'profile.label', default: 'Profile')] as Object[],
                          "Another user has updated this Profile while you were editing")
                render(view: "edit", model: [profileInstance: profileInstance])
                return
            }
        }

        profileInstance.properties = params

        if (!profileInstance.save(flush: true)) {
            render(view: "edit", model: [profileInstance: profileInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])
        redirect(action: "show", id: profileInstance.id)
    }

    def delete() {
        def profileInstance = Profile.get(params.id)
        if (!profileInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
            redirect(action: "list")
            return
        }

        try {
            profileInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
