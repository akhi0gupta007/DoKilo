package com.codebee.products
import com.codebee.User
class Tag {

    User user
    String name

    static constraints = {
        name(blank: false)

    }

    static hasMany = [product:Product]
    static belongsTo = [User,Product]
}
