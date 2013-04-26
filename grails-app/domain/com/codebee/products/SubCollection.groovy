package com.codebee.products

class SubCollection {
	
	static expose = 'subCollection'
	String name
	String description
	String image="web-app/images/Image001.png"
	static belongsTo = CustomCollection
	static hasMany = [subSubCollection:SubSubCollection]
	static constraints = {
		description(size:6..2000,blank:false)
		image(nullable:true)
		name(blank:false)
		
	}
    
}
