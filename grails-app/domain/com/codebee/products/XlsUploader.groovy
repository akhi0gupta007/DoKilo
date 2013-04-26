package com.codebee.products

import java.util.Date;

class XlsUploader {

	String title
	String path
	String webpath
	Date dateCreated
	static belongsTo = com.codebee.User
    static constraints = {
		title(nullable:true)
		path(blank:false)
    }
}
