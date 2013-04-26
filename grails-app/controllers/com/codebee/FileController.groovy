package com.codebee

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class FileController {

    def index(){
		
		}
	def upload()
	 { 
		 boolean stat;
		if(request instanceof MultipartHttpServletRequest){	
		stat=true
		
		MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
		//CommonsMultipartFile f = (CommonsMultipartFile) mpr.getFile("file_upload");
	  
		def mhsr = mpr.getFile('photo')
		if(!mhsr?.empty && mhsr.size){
		mhsr.transferTo(
			new File("web-app/images/themes/gb991.xls")
			)	
		
		}
	
}
		render "Uploaded4${stat}"

	 }
}
