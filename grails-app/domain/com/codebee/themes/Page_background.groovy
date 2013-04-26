package com.codebee.themes

class Page_background {
	String bgcolor
	String align
	String upload="web-app/images/Image001.png"
	static belongsTo = Templates
	
    static constraints = {
		upload(nullable:true)
		bgcolor(nullable:true)
		align(blank:false)
    }
}
