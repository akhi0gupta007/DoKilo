package com.codebee.products

class ProTemplates{

    static belongsTo = [user:com.codebee.User]
    String name
    String flag
    static hasMany = [nameValuePair:NameValuePair]
    static constraints = {
        name(blank: false)
        flag(blank: false)
    }

    static mapping = {
        nameValuePair(lazy: false,cascade:"all")

    }
}
