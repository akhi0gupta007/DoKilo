package com.codebee.products

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Vector;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.springframework.web.context.request.RequestContextHolder


class XlsFetchService {

    def serviceMethod() {
		
    }
	
	def fetchMe(String fileName){
		Insert obj=new Insert()
		Vector arr=obj.read(fileName);
		def token = RequestContextHolder.currentRequestAttributes().getSession()?.user
		List list = saveToDatabase(arr,token)
		return list
		
	}
	
	
	ArrayList saveToDatabase(Vector dataHolder,def token) {
		ArrayList arr = new ArrayList()
		
		String username="";
			  String password="";
			  for (int i=0;i<dataHolder.size(); i++){
				Vector cellStoreVector=(Vector)dataHolder.elementAt(i);
				if(i==0)
				continue;
				
				ArrayList my = new ArrayList()
				
				  for (int j=0; j < cellStoreVector.size();j++){
					 
					  HSSFCell myCell = (HSSFCell)cellStoreVector.elementAt(j);
					  my.add(myCell.toString())
					  									  
				}
			arr.add(my) 
		
				}
			  return arr
		}
	
}
