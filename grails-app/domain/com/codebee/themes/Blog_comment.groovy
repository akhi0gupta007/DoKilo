package com.codebee.themes

class Blog_comment {
	static belongsTo = Templates
	String bgcolor
	String textcolor
	String author_color
	String date_color
	
    static constraints = {
		bgcolor(blank:false)
		textcolor(blank:false)
		author_color(blank:false)
		date_color(blank:false)
    }
}
