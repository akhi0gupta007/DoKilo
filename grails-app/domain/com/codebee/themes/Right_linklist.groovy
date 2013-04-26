package com.codebee.themes

class Right_linklist {
	static belongsTo = Templates
	boolean show_all_collection
	boolean show_all_vendor
	String collection_title
	String vendor_title

    static constraints = {
		collection_title(blank:false)
		vendor_title(blank:false)
    }
}
