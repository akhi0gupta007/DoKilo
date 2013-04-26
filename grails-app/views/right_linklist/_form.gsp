<%@ page import="com.codebee.themes.Right_linklist" %>



<div class="fieldcontain ${hasErrors(bean: right_linklistInstance, field: 'collection_title', 'error')} ">
	<label for="collection_title">
		<g:message code="right_linklist.collection_title.label" default="Collectiontitle" />
		
	</label>
	<g:textField name="collection_title" value="${right_linklistInstance?.collection_title}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_linklistInstance, field: 'show_all_collection', 'error')} ">
	<label for="show_all_collection">
		<g:message code="right_linklist.show_all_collection.label" default="Showallcollection" />
		
	</label>
	<g:checkBox name="show_all_collection" value="${right_linklistInstance?.show_all_collection}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_linklistInstance, field: 'show_all_vendor', 'error')} ">
	<label for="show_all_vendor">
		<g:message code="right_linklist.show_all_vendor.label" default="Showallvendor" />
		
	</label>
	<g:checkBox name="show_all_vendor" value="${right_linklistInstance?.show_all_vendor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_linklistInstance, field: 'vendor_title', 'error')} ">
	<label for="vendor_title">
		<g:message code="right_linklist.vendor_title.label" default="Vendortitle" />
		
	</label>
	<g:textField name="vendor_title" value="${right_linklistInstance?.vendor_title}" />
</div>

