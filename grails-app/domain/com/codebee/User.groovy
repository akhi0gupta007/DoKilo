package com.codebee
import com.codebee.products.CustomCollection
import com.codebee.themes.Templates
import com.codebee.products.SmartCollection
import com.codebee.products.Vendor
import com.codebee.products.ProType
import com.codebee.products.Variants
import com.codebee.products.Product
import com.codebee.products.XlsUploader
import com.codebee.sales.Sales
import com.codebee.marketing.Blog
import com.codebee.logistics.Shipping
import com.codebee.logistics.WareHouse
import com.codebee.products.Books
import com.codebee.products.ProTemplates
import com.codebee.products.Tag
import com.codebee.sales.Customer
import com.codebee.marketing.NewsLetters

class User {
	static expose = 'user'

	static hasMany = [collection:CustomCollection,
					templates:Templates,
                    vendor:Vendor,
					proType:ProType,
					variants:Variants,
					product:Product,
					xlsUploader:XlsUploader,
                    blog:Blog,
                    shipping:Shipping,
                    wareHouse:WareHouse,
                    proTemplates:ProTemplates,
                    tags:Tag,
                    customer:Customer,
                    newsLetters:NewsLetters
					]
	String userId
	String password
	String emailId
	Date dateCreated
	Profile profile
    SmartCollection featured
    String aboutUs
    String domain
    static constraints = {
        domain(nullable: true)
        aboutUs(nullable: true,size: 2..3000)
		userId(size:3..15,unique:true,blank:false)
		password(size:6..12,blank:false)
		emailId(email:true,blank:false,unique:true)
		profile(nullable:true)
        featured(nullable: true)
				
    }
	static mapping = {
        product cascade: 'all-delete-orphan'
        collection cascade: 'all-delete-orphan'

		//profile lazy:false
		//collection lazy:false
		//templates lazy:false
		//smartcollection lazy:false
		//vendor lazy:false
		//proType lazy:false
		//variants lazy:false
		//product lazy:false
		//xlsUploader lazy:false
       // blog lazy: false
       // shipping lazy: false
       // wareHouse lazy: false
		}
}
