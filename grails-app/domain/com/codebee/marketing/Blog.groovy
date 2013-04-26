package com.codebee.marketing

class Blog {

    static belongsTo = [com.codebee.User]
    String content
    Date dateCreated
    boolean comments
    static constraints = {
        content(size:10..7000,blank: false)
    }
}
