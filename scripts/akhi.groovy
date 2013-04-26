import com.codebee.*
import com.codebee.products.*
def user = new User(userId:"akhilesh",password:"t576577",emailId:"a@b.com")
println(user.validate())

def product=new Books(isbn:"232d",title:"laptop",sel_price:20,pro_id:"de12",description:"this is gud thing to take home",user: user)
def cusColl=new CustomCollection(name:"Laptops", description:"The Laptop series",image:"web-app/images/Image001.png")
user.addToCollection(cusColl)
product.addToCollection(cusColl)
user.addToProduct(product)
println(product.validate())

def tag = new Tag(name:"laptops",user:user)

def tag1 = new Tag(name:"computer",user:user)
tag.addToProduct(product)
tag1.addToProduct(product)
println("Tags"+tag.validate()+tag.product);

for (x in product.tags){
print(x.name)
}








/*
def nameValuePair = new NameValuePair(name:"puneet",value:"mental");
def nameValuePair1 = new NameValuePair(name:"varun",value:"mental");
println("Name Value :"+nameValuePair.validate());
def proTemplates = new ProTemplates(name:"akhilesh",user:user,flag:'N');
proTemplates.addToNameValuePair(nameValuePair)
proTemplates.addToNameValuePair(nameValuePair1)
println("Templates :"+proTemplates.validate())

product.proTemplates = proTemplates
println("Product:"+product.validate()+nameValuePair.validate())

//println(user.addToProduct(product))
//println(user.product.size())
/*
for (x in product.collection){
//println(x.description)
}

def variant = new Variants(size:"12");
def custom = new CustomVariant(name:"wood type",value:"redwood")
println (variant.addToCustomVariant(custom))
println("Variant validated"+variant.validate())
println("Custom validated"+custom.validate())

for(x in variant.customVariant){
println("he he "+x.name+" "+x.value)
}
*/
return "Success"
//def books = 