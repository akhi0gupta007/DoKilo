package com.codebee

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class FileUploaderService {
	
	
	def upload(String path,String name,MultipartHttpServletRequest req){
		boolean status = true
		MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)req;
		CommonsMultipartFile f = (CommonsMultipartFile) mpr.getFile("myFile");
	  
		def mhsr = mpr.getFile(name)
		if(!mhsr?.empty && mhsr.size){
		mhsr.transferTo(
			new File(path)
			)
		
		}
		return status
	}
}
