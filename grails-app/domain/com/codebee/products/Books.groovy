package com.codebee.products

import com.codebee.User

class Books extends Product{

    String isbn
    String author
    String isbn13
    String binding
    String pub_date
    String publisher
    int no_of_pages
    String language
    String edition
    byte[] data
   // static belongsTo = [user:User]

    static constraints = {
        author(nullable:true)
        isbn13(nullable:true)
        binding(nullable: true)
        pub_date(nullable:true)
        publisher(nullable:true)
        no_of_pages(nullable:true)
        language(nullable:true)
        edition(nullable:true)
        data(nullable:true)
    }
}
