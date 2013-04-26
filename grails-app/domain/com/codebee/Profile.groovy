package com.codebee

import com.codebee.themes.Templates
import com.codebee.sales.Customer
class Profile {
	
	String address
	String mobile
	String phone
	String purpose
	String expertise
	String country
	String fullName
    Templates template
	static belongsTo = User
	
    static constraints = {
        template(nullable: true)
		address(nullable:true)
		mobile(nullable:true,size:6..11,matches: "[0-9]+")
		phone(nullable:true,size:6..11,matches: "[0-9]+")
		purpose(nullable:true)
		expertise(nullable:true)
		country(nullable:true)
		fullName(nullable:true)
    }
	
	String toString(){
		"Profile for ${fullName}"
		}
}
