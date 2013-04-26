package com.codebee.products

import com.codebee.User

class SmartCollection {
    String name = 'featured'
    static belongsTo = [user:User]
    static hasMany = [product:Product]
    static constraints = {
        product(fetch:'join')
    }
}
