package com.codebee.marketing

import org.springframework.dao.DataIntegrityViolationException
import codebee.*
import com.codebee.common.Logs
import com.codebee.common.NewsMailLog

class NewsLettersController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {

    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [newsLettersInstanceList: NewsLetters.list(params), newsLettersInstanceTotal: NewsLetters.count()]
    }

    def create() {

    }

    def schedule(){
      def x = params.id
        if (!x){
            redirect(action: "show")
        }
       [x:x]
    }

    public static boolean there(List list,Object obj){

        for (x in list){
            if (x.newsLetters.id == obj.id){
                return true

            }
        }
        return false
    }
    
    def templates(){
        def user = session.user.attach()
        def news = NewsLetters.createCriteria().list{
            and {

                eq('user', user)

            }
        }
        def live = []
        
       for (it in news){
           //log.info "List is ${Logs.list()} and obj is ${it}"
            if (there(Logs.list(),it))
            {
               // log.info "Checking ${news.size()}"
                live.add(it)
            }
        }
     // log.info(live)

        [news:news,live:live]
    }

    def live(){
        def user = session.user.attach()
        def news = NewsLetters.createCriteria().list{
            and {

                eq('user', user)

            }
        }
        def live = []

        for (it in news){
            //log.info "List is ${Logs.list()} and obj is ${it}"
            if (there2(Logs.list(),it))
            {
                // log.info "Checking ${news.size()}"
                live.add(there2(Logs.list(),it))
            }
        }
      //  log.info(live)

        [news:news,live:live]
    }
    
    def disable(){
        if (params.id){
            def logs = Logs.findById(params.id)
            logs.active = false
            logs.save()
            flash.message = "Disabled"
            redirect(action: "live")
        }
    }

    def enable(){
        if (params.id){
            def logs = Logs.findById(params.id)
            logs.active = true
            logs.save()
            flash.message = "Enabled"
            redirect(action: "live")
        }
    }

    def logging(){

    def user = session.user.attach()

    def logging = NewsMailLog.createCriteria().list {

       and{
           eq('user', user) 
       }
       

    }
        log.info(logging)

        [logging:logging]
    }

    public static Object there2(List list,Object obj){

        for (x in list){
            if (x.newsLetters.id == obj.id){
                return x

            }
        }
        return null
    }

    def set(){
        def user = session.user.attach()
        boolean val = false
        if (user && params.id && params.period){
           
            def news = NewsLetters.get(params.id)
            if (news)  {
                
                def already = Logs.findByNewsLetters(news)
                if (!already){
                    def logs = new Logs(newsLetters: news,period: params.period,active: params.active)
                    if (logs.validate()){
                        log.info "Validates, Setting in email schedular...."
                        logs.save()
                        flash.message = "EMail Schedular Started, Check Logs for details"
                        redirect(action: "schedule",id: news.id)
                    }  else{
                        flash.message = "Error"
                        log.error(logs.errors)
                        redirect(action: "schedule",id: news.id)
                    }
                }else{
                    already.active = params.active
                    already.period = params.period
                    already.save()
                    flash.message = "EMail Schedular Started, Check Logs for details"
                    redirect(action: "schedule",id: news.id)
                   }

                

            }
           
        }
       // render "${params}"
    }

    def job(){

        def news = NewsLetters.get(2)
        MyJobJob.schedule("0/10 * * * * ?", [g:news])

        def dataLog = new Logs(newsLetters: news,cron: "0/10 * * * * ?")

        if (dataLog.save()){
            log.info "Log Created......"
        }
      //  MyJobJob.triggerNow([greeting:"Hello World"])
        render "Hiii"
    }
    def save() {

    def user = session.user.attach()
     if(user && params.content && params.name){

         def news = new NewsLetters(name: params.name,content: params.content,subject: params.subject,user: user)
         user.addToNewsLetters(news)
         user.save(flush: true)
         redirect(action: "schedule",id: news.id)
     }else{
         flash.message = "Wrong Parameters"
         redirect(action: "show")
     }

    }

    def show() {

    }

    def edit() {
        def newsLettersInstance = NewsLetters.get(params.id)
        if (!newsLettersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsLetters.label', default: 'NewsLetters'), params.id])
            redirect(action: "list")
            return
        }

        [newsLettersInstance: newsLettersInstance]
    }

    def update() {
        def newsLettersInstance = NewsLetters.get(params.id)
        if (!newsLettersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsLetters.label', default: 'NewsLetters'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (newsLettersInstance.version > version) {
                newsLettersInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'newsLetters.label', default: 'NewsLetters')] as Object[],
                          "Another user has updated this NewsLetters while you were editing")
                render(view: "edit", model: [newsLettersInstance: newsLettersInstance])
                return
            }
        }

        newsLettersInstance.properties = params

        if (!newsLettersInstance.save(flush: true)) {
            render(view: "edit", model: [newsLettersInstance: newsLettersInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'newsLetters.label', default: 'NewsLetters'), newsLettersInstance.id])
        redirect(action: "show", id: newsLettersInstance.id)
    }

    def delete() {
        def newsLettersInstance = NewsLetters.get(params.id)
        if (!newsLettersInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'newsLetters.label', default: 'NewsLetters'), params.id])
            redirect(action: "list")
            return
        }

        try {
            newsLettersInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'newsLetters.label', default: 'NewsLetters'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'newsLetters.label', default: 'NewsLetters'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
