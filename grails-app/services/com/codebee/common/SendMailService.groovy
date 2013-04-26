package com.codebee.common

class SendMailService {

    boolean transactional = false

    //Tell the JMS plugin that this is a message endpoint
    static expose = ['jms']

    //The Mail plugin service
    def mailService
    static destination = "sendMail"

    def onMessage(emailMessage) {
        try {
            println("Got email message to ssend....."+emailMessage.model)
            mailService.sendMail {
                to emailMessage.to
                from emailMessage.from
                subject emailMessage.subject
                html emailMessage.model
                log.info("Email is sent.....")
            }
        } catch (Exception e) {
            log.error("Failed to send email ${emailMessage}", e)
        }
        //Return null to avoid poison messages
        return null
    }
}
