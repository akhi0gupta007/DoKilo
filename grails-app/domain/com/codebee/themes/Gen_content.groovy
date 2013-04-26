package com.codebee.themes

class Gen_content {
	String bgcolor_color
	String headers_color
	String text_color
	String Links_color
	String Links_Hover_color
	String sec_color
	String table_header_color
	static belongsTo = Templates
    static constraints = {
		bgcolor_color(nullable:true)
		headers_color(nullable:true)
		text_color(blank:false)
		sec_color(nullable:true)
		table_header_color(nullable:true)
    }
}
