<%@ page import="com.codebee.products.Variants" %>



<div class="fieldcontain ${hasErrors(bean: variantsInstance, field: 'size', 'error')} ">
	<label for="size">
		<g:message code="variants.size.label" default="Size" />
		
	</label>
	<g:textField name="size" value="${variantsInstance?.size}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: variantsInstance, field: 'color', 'error')} ">
	<label for="color">
		<g:message code="variants.color.label" default="Color" />
		
	</label>
	<g:textField name="color" value="${variantsInstance?.color}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: variantsInstance, field: 'mat', 'error')} ">
	<label for="mat">
		<g:message code="variants.mat.label" default="Mat" />
		
	</label>
	<g:textField name="mat" value="${variantsInstance?.mat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: variantsInstance, field: 'style', 'error')} ">
	<label for="style">
		<g:message code="variants.style.label" default="Style" />
		
	</label>
	<g:textField name="style" value="${variantsInstance?.style}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: variantsInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="variants.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${variantsInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: variantsInstance, field: 'customVariant', 'error')} ">
	<label for="customVariant">
		<g:message code="variants.customVariant.label" default="Custom Variant" />
		
	</label>
	<g:select name="customVariant" from="${com.codebee.products.CustomVariant.list()}" multiple="multiple" optionKey="id" size="5" value="${variantsInstance?.customVariant*.id}" class="many-to-many"/>
</div>

