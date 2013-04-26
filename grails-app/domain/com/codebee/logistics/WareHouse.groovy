package com.codebee.logistics

class WareHouse {

    String name
    String location
    static belongsTo = [com.codebee.User]
    static hasMany = [product:com.codebee.products.Product]

    static constraints = {
        name(blank: false)
        location(nullable: true,size: 2..2000)
    }
}
