package com.codebee.products

class SubSubCollection {

	
	String name
	String description
	String image="web-app/images/Image001.png"
	static belongsTo = SubCollection
	static constraints = {
		description(size:6..2000,blank:false)
		image(nullable:true)
		name(blank:false)
		
	}
}
