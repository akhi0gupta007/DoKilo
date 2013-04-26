package com.codebee.sales

import com.codebee.products.Product
import com.codebee.Profile

class Customer {

    static belongsTo = [user:com.codebee.User]
    String cusUserId
    String cusPassword
    String  cusEmailId
    Date dateCreated
    ProfileCustomer  cusProfile
    static hasMany = [product:Product]
    static constraints = {
        cusUserId(size:3..15,unique:true,blank:false)
        cusPassword(size:6..12,blank:false)
        cusEmailId(email:true,blank:false,unique:true)
        cusProfile(nullable:true)
    }
}
