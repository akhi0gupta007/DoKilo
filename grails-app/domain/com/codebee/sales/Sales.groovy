package com.codebee.sales
import java.util.Date;

import com.codebee.themes.Templates
import com.codebee.User
class Sales {
	
	Date dateCreated
	User user
	Templates temp
	
    static constraints = {
		user(blank:false,unique:true)
		temp(blank:false)
    }
}
