package com.codebee.products
import com.codebee.User
class Product {
	
	static belongsTo = [user:User]
    boolean showPro = true
	String title
	String description
	static hasMany = [collection:CustomCollection,tags:Tag]
	Vendor vendor
	ProType type
	String image
	Double sel_price
	Double list_price
	Double weight
	String dimen
	String pkg_dimen
	String pro_id
	int quan
	boolean tax
	boolean ship_addr
	boolean ofo
	Date avail
    Date dateCreated
	Variants variants
    ProTemplates proTemplates
	static expose = 'product'
    static constraints = {
		sel_price(blank:false)
        proTemplates(nullable: true)
		title(blank:false)
		list_price(nullable:true)
		description(size:3..2000,nullable: true)
		image(nullable:true)
		title(blank:false)
		vendor(nullable:true)
		type(nullable:true)
		image(nullable:true)
		weight(nullable:true)
		dimen(nullable:true)
		pkg_dimen(nullable:true)
		pro_id(nullable: true)
		quan(nullable:true)
		avail(nullable:true)
		variants(nullable:true)
    }
	static mapping = {
        vendor fetch: 'join'
        type fetch: 'join'
        tablePerHierarchy false
        sort dateCreated:"desc"

	//	vendor(lazy: false)
      //  type(lazy: false)
		//collection lazy:false
	
		}
}
