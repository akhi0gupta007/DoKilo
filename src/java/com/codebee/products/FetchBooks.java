package com.codebee.products;

import java.sql.*;
import java.util.List;

/**
 *
 * User: akhilesh
 * Date: 4/5/12
 * Time: 10:25 AM
 * To change this template use File | Settings | File Templates.
 */
public class FetchBooks {
    Connection con;
    Statement stmt;
    PreparedStatement pst;
    ResultSet rs;

    public Connection getConnection(){
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String url =
                "jdbc:mysql://localhost:3306/mydbb";
        con =
                DriverManager.getConnection(
                        url, "root", "9868");
        }catch (Exception ex){
           ex.printStackTrace();
        }
        return con;
    }
    
    public ResultSet getBooksByIsbn(String isbn) throws Exception{
        Connection con = this.getConnection();
        String query = "Select * from bookInfo where isbn ='"+isbn+"'";
        PreparedStatement pst = con.prepareStatement(query);
        ResultSet rs = pst.executeQuery();
       // con.close();
        return rs;
    }
}
