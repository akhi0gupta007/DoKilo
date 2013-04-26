<%@ page import="com.codebee.logistics.WareHouse" %>



<div class="fieldcontain ${hasErrors(bean: wareHouseInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="wareHouse.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${wareHouseInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wareHouseInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="wareHouse.location.label" default="Location" />
		
	</label>
	<g:textArea name="location" cols="40" rows="5" maxlength="2000" value="${wareHouseInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wareHouseInstance, field: 'product', 'error')} ">
	<label for="product">
		<g:message code="wareHouse.product.label" default="Product" />
		
	</label>
	<g:select name="product" from="${com.codebee.products.Product.list()}" multiple="multiple" optionKey="id" size="5" value="${wareHouseInstance?.product*.id}" class="many-to-many"/>
</div>

