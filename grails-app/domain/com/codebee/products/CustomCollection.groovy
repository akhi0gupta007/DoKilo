package com.codebee.products

import com.codebee.User
class CustomCollection {
	
	static expose = 'customCollection'
    CustomCollection parent = null
	static belongsTo = [User,Product,Books]
	String name
	String description
	String image
    boolean root = true
    boolean showColl = true
	static hasMany = [product:Product,collection:CustomCollection]
    static constraints = {

		description(size:6..2000,nullable:true)
		image(nullable:true)
		name(blank:false)
		
    }

    static fetchMode = [collection: 'eager']
    static mapping = {
        collection cascade: 'all-delete-orphan'


    }
	
}
