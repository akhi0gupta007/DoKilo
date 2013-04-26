package com.codebee.themes

class Header_logo {
	boolean text_image_toggle
	String custom_logo="web-app/images/Image001.png"
	String logo_link_color
	String logo_link_color_hover
	short font_size
	String font_style
	static belongsTo = Templates
    static constraints = {
		custom_logo(nullable:true)
		logo_link_color(blank:false)
		logo_link_color_hover(blank:false)
		font_size(blank:false)
		font_style(blank:false)
    }
}
