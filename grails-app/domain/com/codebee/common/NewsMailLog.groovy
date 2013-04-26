package com.codebee.common

import com.codebee.marketing.NewsLetters
import com.codebee.User

class NewsMailLog {

    NewsLetters newsLetters
    Date sent
    String receiver
    User user
    
    static constraints = {
        newsLetters(blank:false)
        sent(blank:false)
        user(blank:false)
        receiver(blank: false,email: true)
    }
}
