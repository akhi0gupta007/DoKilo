package com.codebee.themes

class Homepage {
	

	static belongsTo = Templates

	boolean recently = true
    boolean featured = true
    boolean search = true
	short max_no_items = 15
    static constraints = {
		max_no_items(blank:false)
    }
}
