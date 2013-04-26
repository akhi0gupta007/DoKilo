package com.codebee.themes

class Home_slides {
	static belongsTo = Templates
	boolean show_slides
	int slide_height 
	String button_color
	String button_arrow_color
	String button_color_hov
	String button_arrow_color_hov
	String slide1 ="web-app/images/Image001.png"
	String slide2 ="web-app/images/Image001.png"
	String slide3="web-app/images/Image001.png"
	String slide4="web-app/images/Image001.png"
	String slide5="web-app/images/Image001.png"
	String slide6="web-app/images/Image001.png"
	boolean show_slide1
	boolean show_slide2
	boolean show_slide3
	boolean show_slide4
	boolean show_slide5
	boolean show_slide6
    static constraints = {
		slide1(nullable:true)
		slide2(nullable:true)
		slide3(nullable:true)
		slide4(nullable:true)
		slide5(nullable:true)
		slide6(nullable:true)
		slide_height(blank:false)
    }
}
