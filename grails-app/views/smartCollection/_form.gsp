<%@ page import="com.codebee.products.SmartCollection" %>



<div class="fieldcontain ${hasErrors(bean: smartCollectionInstance, field: 'item', 'error')} ">
	<label for="item">
		<g:message code="smartCollection.item.label" default="Item" />
		
	</label>
	<g:textField name="item" value="${smartCollectionInstance?.item}" />
</div>

