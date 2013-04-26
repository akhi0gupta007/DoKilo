/**
 * 
 */
package com.codebee;


import java.security.SecureRandom;
import java.math.BigInteger;


/**
 * @author Akhilesh
 *
 */
public class Token {

	
	private SecureRandom random = new SecureRandom();

	  public String nextSessionId()
	  {
	    return new BigInteger(130, random).toString(32);
	  }

}
