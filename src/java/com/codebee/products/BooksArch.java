package com.codebee.products;
import java.sql.ResultSet;
/**
 *
 * User: akhilesh
 * Date: 4/6/12
 * Time: 12:29 PM
 * To change this template use File | Settings | File Templates.
 */
public class BooksArch {
    
    public BooksArch getBook(String isbn) throws Exception{
      ResultSet rs =  new FetchBooks().getBooksByIsbn(isbn);

      if(rs.next()){
       this.name = rs.getString(2);
       this.author = rs.getString(3);
       this.isbn = rs.getString(4);
       this.isbn13 = rs.getString(5);
       this.binding = rs.getString(6);
       this.pub_date = rs.getString(7);
       this.publisher = rs.getString(8);
       this.no_of_pages = rs.getString(9);
       this.language = rs.getString(10);
       this.dimensions = rs.getString(11);
       this.weight = rs.getString(12);
       this.edition = rs.getString(13);
       this.description = rs.getString(14);
       this.data = rs.getBytes(15);
       this.mp = rs.getString(16);
      }
      return this;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getIsbn13() {
        return isbn13;
    }

    public void setIsbn13(String isbn13) {
        this.isbn13 = isbn13;
    }

    public String getBinding() {
        return binding;
    }

    public void setBinding(String binding) {
        this.binding = binding;
    }

    public String getPub_date() {
        return pub_date;
    }

    public void setPub_date(String pub_date) {
        this.pub_date = pub_date;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getNo_of_pages() {
        return no_of_pages;
    }

    public void setNo_of_pages(String no_of_pages) {
        this.no_of_pages = no_of_pages;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDimensions() {
        return dimensions;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }


    public String getMp() {
        return mp;
    }

    public void setMp(String mp) {
        this.mp = mp;
    }



    String no_of_pages;
    String language;
    String dimensions;
    String weight;
    String edition;
    byte[] data;
    String mp;

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    String name;
    String author;
    String description;
    String isbn;
    String isbn13;
    String binding;
    String pub_date;
    String publisher;
            
}
