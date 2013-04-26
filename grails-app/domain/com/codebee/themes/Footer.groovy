package com.codebee.themes

class Footer {
	static belongsTo = Templates
	String bgcolor
	String textcolor
	String link_color
	String link_color_hov
	String footer_list //maps to main menu,cat,footer
	String social_icon_color
	boolean fb_like
	boolean twitter_share
	boolean google_plusone
	boolean flicker_share
    static constraints = {
		bgcolor(nullable:true)
		textcolor(blank:false)
		link_color(blank:false)
		link_color_hov(blank:false)
		footer_list(blank:false)
		social_icon_color(blank:false)
    }
}
