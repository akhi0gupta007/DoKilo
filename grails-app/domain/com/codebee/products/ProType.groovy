package com.codebee.products
import com.codebee.User

class ProType {
	String type
	static expose = 'proType'
	static belongsTo = User
    static constraints = {
		type(blank:false)
		
    }
}
