package com.codebee

import static org.junit.Assert.*
import org.junit.*

class UserIntegrationTests {

    @Before
    void testStaticUser() {
        // Setup logic here
		

		def user=new com.codebee.User(userId:"raju",password:"passwds",emailId:"emai@yahoo.com")
		def profile=new Profile(fullName:"Raju Srivastav",mobile:"986834322")
		assertTrue profile.validate()
		assertTrue user.validate()
		assertNotNull user.userId
		assertEquals 'raju',user.userId
		user.profile=profile
	
		assertEquals 'Raju Srivastav',user.profile.fullName
    }

}
