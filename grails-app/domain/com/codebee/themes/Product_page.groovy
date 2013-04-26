package com.codebee.themes

import com.codebee.products.CustomCollection

class Product_page {
	static belongsTo = Templates
	static hasMany = [collection:CustomCollection]
	boolean show_ven_below
	String product_name_font
	byte product_name_font_size
	String addedtoCart_color
	String price_color
	boolean fb_like
	boolean twitter_share
	boolean google_plusone
	//CustomCollection collection //Link from Collection, to be defined later
	byte numof_collection_items
    static constraints = {
		product_name_font_size(blank:false)
		numof_collection_items(blank:false)
		
    }
}
