package com.codebee

import com.codebee.themes.Templates
import java.util.Date;

class SiteAdmin {

	String userId
	String password
	String emailId
	Date dateCreated
	static hasMany = [
						templates:Templates
						]
	static constraints = {
		userId(size:3..15,unique:true,blank:false)
		password(size:6..8,blank:false)
		emailId(email:true,blank:false,unique:true)
	}
}
