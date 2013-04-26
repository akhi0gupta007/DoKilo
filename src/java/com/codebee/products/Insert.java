/**
 * 
 */
package com.codebee.products;

/**
 * @author akhilesh
 *
 */
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.regex.*;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class Insert {

		public Vector read(String fileName)    {
			
			Vector cellVectorHolder = new Vector();
			try{
				  FileInputStream myInput = new FileInputStream(fileName);
				  POIFSFileSystem myFileSystem = new POIFSFileSystem(myInput);
				  HSSFWorkbook myWorkBook = new HSSFWorkbook(myFileSystem);
				  HSSFSheet mySheet = myWorkBook.getSheetAt(0);
				  Iterator rowIter = mySheet.rowIterator(); 
				  while(rowIter.hasNext()){
					  HSSFRow myRow = (HSSFRow) rowIter.next();
					  Iterator cellIter = myRow.cellIterator();
					  Vector cellStoreVector=new Vector();
					  while(cellIter.hasNext()){
						  HSSFCell myCell = (HSSFCell) cellIter.next();
						  cellStoreVector.addElement(myCell);
					  }
					  cellVectorHolder.addElement(cellStoreVector);
				  }
			}catch (Exception e){e.printStackTrace(); }
			return cellVectorHolder;
		}
		
	
}
