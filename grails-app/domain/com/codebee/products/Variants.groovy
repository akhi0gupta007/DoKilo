package com.codebee.products

class Variants {

	static expose = 'variants'
    String var_title
    String size
    String color
    String mat
    String style
    static hasMany = [customVariant:CustomVariant]
	static belongsTo = [Product,Books]
    static constraints = {
		size(nullable:true)
		color(nullable:true)
		mat(nullable:true)
		style(nullable:true)
        var_title(nullable:true)
		customVariant(nullable:true)
    }
}
