package com.codebee.products

class NameValuePair {

    String name;
    String value;
    static belongsTo = [ProTemplates]
    static constraints = {
        name(blank: false)
        value(nullable: true)
    }



}
