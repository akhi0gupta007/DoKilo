package com.codebee.common

class EmailService {

    boolean transactional = false

    def sendEmail(attrs) {
        log.info("Came in 1st step.....")
        sendJMSMessage("sendMail",
                [to: attrs.to,
                        from: attrs.from,
                        subject: attrs.subject,
                        view: attrs.view,
                        model: attrs.model])
    }
}
