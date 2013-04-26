package com.codebee.products
import com.codebee.User
import static org.junit.Assert.*
import org.junit.*

class ProductIntegrationTests {

	/**
	 * This Test Case Adds a Real Product
	 * @Akhilesh, Codebee
	 */
	void testStaticProduction() {
		
		def user=new User(userId:"raju",password:"passwds",emailId:"emai@yahoo.com")
		def product=new Product(title:"laptop",sel_price:20,pro_id:"de12",description:"this is gud thing to take home",user: user)
		def subSubColl=new SubSubCollection(name:"inspiron",description:"The black laptops")
		def subColl=new SubCollection(name:"Dell", description:"The dell series")
		def cusColl=new CustomCollection(name:"Laptops", description:"The Laptop series",image:"web-app/images/Image001.png")
		def vendor=new Vendor(ven_name:"Dell",website:"http://www.dell.com")
		def customVariant = new CustomVariant(name:"Hard Disk",value:"240 GB")
		def variants = new Variants(title:"Other Available",color:"red",style:"thinkpad style")
		def ty= new ProType(type:"hijhjass")
		assertNotNull ty.save()
		assertNotNull user.addToProType(ty)
		
		assertTrue variants.validate()
		assertTrue customVariant.validate()
		variants.addToCustomVariant(customVariant)
		def date = new Date()
		
		product.variants = variants // Adding this Variants to Product
		product.avail = date
		
		user.addToVendor(vendor) //User is adding Vendor
		
		subColl.addToSubSubCollection(subSubColl)
		cusColl.addToSubCollection(subColl)
		
		assertTrue vendor.validate()
		assertTrue user.validate()
		assertTrue product.validate()
		assertTrue subSubColl.validate()
		assertTrue subColl.validate()
		assertTrue cusColl.validate()
		
		assertNotNull product.save()
		assertNotNull user.save()
		assertNotNull user.id
		user.addToCollection(cusColl)
		user.addToProduct(product)
		
		
		assertEquals "laptop",product.title
		assertEquals 1, user.product[0] //Successfully added product, if reached this far
				
		
		}
		
}
