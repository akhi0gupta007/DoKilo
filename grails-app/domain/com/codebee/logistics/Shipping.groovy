package com.codebee.logistics

class Shipping {

    static belongsTo = [user :com.codebee.User]

    String plan
    double up_wt
    double lo_wt
    boolean wt_based
    double up_price
    double lo_price
    double price
    static constraints = {
        plan(blank: false)
        price(blank:false)
    }
}
