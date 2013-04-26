package com.codebee.common

import com.codebee.marketing.NewsLetters

class Logs {

    String period
    NewsLetters newsLetters
    Date dateCreated
    Date lastSent
    boolean active = false


    static constraints = {
            period(blank: false)
            newsLetters(blank:false,unique: true)
            lastSent(nullable: true)

    }
}
