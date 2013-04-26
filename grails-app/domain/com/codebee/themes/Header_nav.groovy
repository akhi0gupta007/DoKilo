package com.codebee.themes

class Header_nav {
	String Links_color
	String Links_Hover_color
	short font_size
	String font_style
	String divider_nav_link
	String drop_menu_bgcolor
	String menu_border_color
	static belongsTo = Templates
    static constraints = {
		drop_menu_bgcolor(nullable:true)
		font_size(blank:false)
		font_style(blank:false)
		
    }
}
