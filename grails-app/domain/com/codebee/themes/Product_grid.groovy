package com.codebee.themes

class Product_grid {
	static belongsTo = Templates
	String header_color
	byte header_font_size
	String header_font_style
	String bgcolor_behind_name
	String text_color
	String link_color
	String link_color_hov
	String price_color
	String bgcolor_price_color
    static constraints = {
		bgcolor_price_color(nullable:true)
		bgcolor_behind_name(nullable:true)
		header_font_size(blank:false)
    }
}
