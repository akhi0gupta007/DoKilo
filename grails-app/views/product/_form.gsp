<%@ page import="com.codebee.products.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'sel_price', 'error')} required">
	<label for="sel_price">
		<g:message code="product.sel_price.label" default="Selprice" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="sel_price" required="" value="${fieldValue(bean: productInstance, field: 'sel_price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'list_price', 'error')} ">
	<label for="list_price">
		<g:message code="product.list_price.label" default="Listprice" />
		
	</label>
	<g:field type="number" name="list_price" value="${fieldValue(bean: productInstance, field: 'list_price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" required="" value="${productInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="product.image.label" default="Image" />
		
	</label>
	<g:textField name="image" value="${productInstance?.image}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="product.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${productInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'vendor', 'error')} ">
	<label for="vendor">
		<g:message code="product.vendor.label" default="Vendor" />
		
	</label>
	<g:select id="vendor" name="vendor.id" from="${com.codebee.products.Vendor.list()}" optionKey="id" value="${productInstance?.vendor?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="product.type.label" default="Type" />
		
	</label>
	<g:select id="type" name="type.id" from="${com.codebee.products.ProType.list()}" optionKey="id" value="${productInstance?.type?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="product.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="weight" required="" value="${fieldValue(bean: productInstance, field: 'weight')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'dimen', 'error')} ">
	<label for="dimen">
		<g:message code="product.dimen.label" default="Dimen" />
		
	</label>
	<g:textField name="dimen" value="${productInstance?.dimen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'pkg_dimen', 'error')} ">
	<label for="pkg_dimen">
		<g:message code="product.pkg_dimen.label" default="Pkgdimen" />
		
	</label>
	<g:textField name="pkg_dimen" value="${productInstance?.pkg_dimen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'pro_id', 'error')} required">
	<label for="pro_id">
		<g:message code="product.pro_id.label" default="Proid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pro_id" required="" value="${productInstance?.pro_id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'quan', 'error')} required">
	<label for="quan">
		<g:message code="product.quan.label" default="Quan" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="quan" required="" value="${fieldValue(bean: productInstance, field: 'quan')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'avail', 'error')} ">
	<label for="avail">
		<g:message code="product.avail.label" default="Avail" />
		
	</label>
	<g:datePicker name="avail" precision="day"  value="${productInstance?.avail}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'variants', 'error')} ">
	<label for="variants">
		<g:message code="product.variants.label" default="Variants" />
		
	</label>
	<g:select id="variants" name="variants.id" from="${com.codebee.products.Variants.list()}" optionKey="id" value="${productInstance?.variants?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'collection', 'error')} ">
	<label for="collection">
		<g:message code="product.collection.label" default="Collection" />
		
	</label>
	<g:select name="collection" from="${com.codebee.products.CustomCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${productInstance?.collection*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'ofo', 'error')} ">
	<label for="ofo">
		<g:message code="product.ofo.label" default="Ofo" />
		
	</label>
	<g:checkBox name="ofo" value="${productInstance?.ofo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'ship_addr', 'error')} ">
	<label for="ship_addr">
		<g:message code="product.ship_addr.label" default="Shipaddr" />
		
	</label>
	<g:checkBox name="ship_addr" value="${productInstance?.ship_addr}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'smart', 'error')} ">
	<label for="smart">
		<g:message code="product.smart.label" default="Smart" />
		
	</label>
	<g:select name="smart" from="${com.codebee.products.SmartCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${productInstance?.smart*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'tax', 'error')} ">
	<label for="tax">
		<g:message code="product.tax.label" default="Tax" />
		
	</label>
	<g:checkBox name="tax" value="${productInstance?.tax}" />
</div>

