package com.codebee.themes

class Gen_fonts {
	String heading_font
	String body_font
	short body_font_size
	static belongsTo = Templates
    static constraints = {
		heading_font(blank:false)
		body_font(blank:false)
		body_font_size(blank:false)
    }
}
