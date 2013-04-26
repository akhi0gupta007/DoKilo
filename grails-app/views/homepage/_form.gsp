<%@ page import="com.codebee.themes.Homepage" %>



<div class="fieldcontain ${hasErrors(bean: homepageInstance, field: 'max_no_items', 'error')} required">
	<label for="max_no_items">
		<g:message code="homepage.max_no_items.label" default="Maxnoitems" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="max_no_items" required="" value="${fieldValue(bean: homepageInstance, field: 'max_no_items')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: homepageInstance, field: 'collection', 'error')} ">
	<label for="collection">
		<g:message code="homepage.collection.label" default="Collection" />
		
	</label>
	<g:select name="collection" from="${com.codebee.products.CustomCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${homepageInstance?.collection*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: homepageInstance, field: 'product', 'error')} ">
	<label for="product">
		<g:message code="homepage.product.label" default="Product" />
		
	</label>
	<g:textField name="product" value="${homepageInstance?.product}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: homepageInstance, field: 'show_collection_name', 'error')} ">
	<label for="show_collection_name">
		<g:message code="homepage.show_collection_name.label" default="Showcollectionname" />
		
	</label>
	<g:checkBox name="show_collection_name" value="${homepageInstance?.show_collection_name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: homepageInstance, field: 'show_desc', 'error')} ">
	<label for="show_desc">
		<g:message code="homepage.show_desc.label" default="Showdesc" />
		
	</label>
	<g:checkBox name="show_desc" value="${homepageInstance?.show_desc}" />
</div>

<div class="fieldcontain ${hasErrors(bean: homepageInstance, field: 'smartColl', 'error')} ">
	<label for="smartColl">
		<g:message code="homepage.smartColl.label" default="Smart Coll" />
		
	</label>
	<g:checkBox name="smartColl" value="${homepageInstance?.smartColl}" />
</div>

<div class="fieldcontain ${hasErrors(bean: homepageInstance, field: 'smartcollection', 'error')} ">
	<label for="smartcollection">
		<g:message code="homepage.smartcollection.label" default="Smartcollection" />
		
	</label>
	<g:select name="smartcollection" from="${com.codebee.products.SmartCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${homepageInstance?.smartcollection*.id}" class="many-to-many"/>
</div>

