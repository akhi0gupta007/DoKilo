package com.codebee
import org.springframework.web.context.request.RequestContextHolder
class AuthService {

    def check(String ids,String token) {
		boolean stat =false
		def token1 = RequestContextHolder.currentRequestAttributes().getSession()?.token
		String val = RequestContextHolder.currentRequestAttributes().getSession()?.val
		if(val.equals(ids) && (token1.equals(token))){
			stat = true
			return stat
			}		
		else{
			return stat
			}
		
    }
}
