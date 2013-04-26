package com.codebee

class TokenGeneratorService {
	static scope = "session"
    def getToken() {
	//String value = String.valueOf(val);
	Token obj = new Token()
	String object=obj.nextSessionId()
	return object
    }
}
 