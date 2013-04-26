package com.codebee.common

class SendMailController {
    //Our email queuing service
    def emailService

    def index = {
        try {
            emailService.sendEmail(to: "qwert2099@gmail.com",
                    from: "akhi0gupta0007@gmail.com",
                    subject: "Test HTML mail using JMS, ActiveMQ, and the Grails Mail plugin",
                    model: [greeting: "Hello World!"],
                    view: "/common/_emailTest")

        } catch (Exception e) {
            log.error("${e}", e)
            flash.message = "Mail not sent: ${e}"
            return
        }
        flash.message = "Mail sent"
    }
}
