package com.codebee.themes

import java.util.Date;

class Templates {

	String name
	Date dateCreated
    String css
    String logo
    String storeName
    Homepage homePage
	/*
    Gen_button gen_button
	Gen_content gen_content
	Gen_fonts gen_fonts
	Page_background page_bg
	Header_cart head_cart
	Header_logo head_logo
	Header_nav head_nav
	Header_search head_search
	Homepage homepage
	Home_slides slides
	Right_linklist right_list
	Right_look right_look
	Right_twitter right_twi
	Right_welcome right_wel
	Product_grid pro_grid
	Product_page pro_page
	Cart_page cart_page
	Blog_comment blog
	Footer footer
	*/
    static belongsTo = [com.codebee.User,com.codebee.SiteAdmin]
	boolean enable = false
    static constraints = {
        homePage(nullable: true)
        css(blank: false)
        logo(nullable: true)
        storeName(nullable: true)
		name(blank:false)

        /*
		gen_button(nullable:true)
		gen_content(nullable:true)
		gen_fonts(nullable:true)
		page_bg(nullable:true)
		head_cart(nullable:true)
		head_logo(nullable:true)
		head_nav(nullable:true)
		head_search(nullable:true)
		homepage(nullable:true)
		slides(nullable:true)
		right_list(nullable:true)
		right_look(nullable:true)
		right_twi(nullable:true)
		right_wel(nullable:true)
		pro_grid(nullable:true)
		pro_page(nullable:true)
		cart_page(nullable:true)
		blog(nullable:true)
		footer(nullable:true)
		*/
    }

    static mapping = {
        homePage(fetch: 'join')

       // page_bg fetch: 'join'
    }
}
