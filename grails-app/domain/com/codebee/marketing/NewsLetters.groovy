package com.codebee.marketing

class NewsLetters {

    String name
    String subject = "NewLetter"
    String content
    Date dateCreated
    static belongsTo = [user:com.codebee.User]

    static constraints = {
        name(blank: false)
        subject(nullable: true)
        content(blank: false,size: 2..10000)

    }
}
