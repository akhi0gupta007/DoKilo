package com.codebee.products

import java.util.Date
import com.codebee.User

class Vendor {
	static expose = 'vendor'
	String ven_name
	String description
	Date dateCreated
	String website
    boolean showColl = true
	static belongsTo = User
    static constraints = {
		description(size:6..2000,nullable:true)
		ven_name(blank:false)
		website(nullable:true,url:true)
		
    }
}
