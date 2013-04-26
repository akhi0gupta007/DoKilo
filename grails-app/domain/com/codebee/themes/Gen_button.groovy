package com.codebee.themes

class Gen_button {
	String color
	String text_color
	String color_hover
	String text_color_hover
	static belongsTo = Templates
    static constraints = {
		color(blank:false)
		text_color(blank:false)
		color_hover(blank:false)
		text_color_hover(blank:false)
    }
}
