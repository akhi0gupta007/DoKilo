package com.codebee.themes

class Right_welcome {
	
	boolean show_widget
	String wel_title
	String wel_desc
	static belongsTo = Templates
    static constraints = {
		wel_desc(size:6..2000,blank:false)
		wel_title(blank:false)
		
    }
}
