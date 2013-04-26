import grails.util.Environment
import com.codebee.themes.Templates
import com.codebee.SiteAdmin
import codebee.*
import com.codebee.common.Logs
import com.codebee.marketing.NewsLetters
class BootStrap {

    def init = { servletContext ->
        switch (Environment.current) {
            case Environment.DEVELOPMENT:
                createAdminUserIfRequired()
                //startScheduler()
                break;

            case Environment.PRODUCTION:
                createAdminUserIfRequired()
                log.info "Creating Admin for production"
                break;
        }

    }
    def destroy = {
    }

    void createAdminUserIfRequired(){
       if(!SiteAdmin.findByUserId('admin')){
           log.info "Fresh Admin is going to be created......."
           def template1 = new Templates(name: "css1",css: "css1.css")
           def template2 = new Templates(name: "css2",css: "css2.css")
           def template3 = new Templates(name: "css3",css: "css3.css")
           def siteAdmin = new SiteAdmin(userId: 'admin',password: 'admin123',emailId: 'admin@codebee.in')
         
           if(template1.validate() && siteAdmin.validate()){
             siteAdmin.addToTemplates(template1)
             siteAdmin.addToTemplates(template2)
             siteAdmin.addToTemplates(template3)
             siteAdmin.save(flush: true) 
           }

       }else{
           log.info "We already have siteAdmin"
       }                              
    }

    void startScheduler(){
        
        log.info "Going to start the schedular now ....."
        def  list = Logs.list()
        
        for(x in list){
            log.info "Putting ${x.cron} to work......................"
            MyJobJob.schedule(x.cron, [g:x.newsLetters])
        }

    }
}
