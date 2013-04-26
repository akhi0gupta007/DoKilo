package com.codebee.themes

import static org.junit.Assert.*
import org.junit.*

import com.codebee.SiteAdmin

class ThemeIntegrationTests {

	void testStaticThemes(){
		
		def admin=new SiteAdmin(userId:"raju",password:"passwds",emailId:"emai@yahoo.com")
		assertTrue admin.validate()
		assertNotNull admin.save()
		
		def pgback = new Page_background(bgcolor:"#7FFFD4",align:"center")
		
		assertTrue pgback.validate()
		assertNotNull pgback.save()
		
		def tmp = new Templates(name:"skyfall")
		tmp.page_bg = pgback
		
		admin.addToTemplates(tmp)
		
		assertTrue tmp.validate()
		
		assertNotNull tmp.save()
		}
}
