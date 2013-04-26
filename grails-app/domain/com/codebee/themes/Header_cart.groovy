package com.codebee.themes

class Header_cart {
	String bgcolor
	String Links_color
	String Links_Hover_color
	String divider_color
	String cart_icon
	static belongsTo = Templates
    static constraints = {
		bgcolor(nullable:true)
		cart_icon(nullable:true)
    }
}
