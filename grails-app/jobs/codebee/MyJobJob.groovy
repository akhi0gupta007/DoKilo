package codebee

import org.quartz.JobExecutionContext
import org.quartz.JobExecutionException
import com.codebee.common.Logs
import com.codebee.common.EmailService
import com.codebee.common.NewsMailLog

class MyJobJob {
    def emailService
    
    static triggers = {
       // simple name: 'mySimpleTrigger', startDelay: 60000, repeatInterval: 1000000000
        cron name: 'myTrigger', cronExpression: "10 01 * * * ?"

    }
    def group = "MyGroup"

    def execute(JobExecutionContext context) throws JobExecutionException {
        try{

            //log.debug(“Job has been called, sending mail”);
//Call the sendEmail method in the email service
   //         def x = context.mergedJobDataMap
           def logs = Logs.listOrderByDateCreated()
         //  int i = -1 
            for (it in logs) {
//print it.newsLetters
                if (it.period.equalsIgnoreCase("Weekly") && it.active) {

                    def today = new Date()
                    def weekAfter = today + 7


                    if (it.lastSent){

                        def sentDate = it.lastSent

                        def tobeSent = sentDate + 6

                      if(today <= tobeSent) {
                          log.info "Dont send now, already sent at ${sentDate} will be sending after ${tobeSent}"
                          continue;
                     }

                  }

                    log.info "Need to Sent Weekly"
                    log.info "Mailer Belongs to ${it.newsLetters.user.userId}"
                    def user = it.newsLetters.user
                    log.info "Reciepient are ${user.customer}"
                    for (x in user.customer) {

                        log.info "Sending to ....${x.cusEmailId}"

                        try {
                            emailService.sendEmail(to: x.cusEmailId,
                                    from: "akhi0gupta0007@gmail.com",
                                    subject: it.newsLetters.subject,
                                    model: it.newsLetters.content,
                                    view: "/common/_emailTest")

                            def db = new NewsMailLog(newsLetters: it.newsLetters, sent: new Date(), receiver: x.cusEmailId, user: user)
                            if (db.validate()) {
                                db.save()
                                log.info "Saving Details in Log..."

                                it.lastSent = new Date()
                                it.save()

                            } else {
                                log.error("Error occured in saving..............................................***********")
                                log.error(db.errors)
                            }


                        } catch (Exception e) {
                            log.error("Error in Sending.............................**************************")
                            log.error("${e}", e)
                            //flash.message = "Mail not sent: ${e}"
                            return
                        }

                    }


                }
            }
            print "Sent Mail : ..... "

        }catch (Throwable e) {

            throw new JobExecutionException(e.getMessage(), e);

        }
        //"
        // execute job
    }
}
