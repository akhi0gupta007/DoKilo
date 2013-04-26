<%@ page import="com.codebee.products.SubSubCollection" %>



<div class="fieldcontain ${hasErrors(bean: subSubCollectionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="subSubCollection.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" required="" value="${subSubCollectionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subSubCollectionInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="subSubCollection.image.label" default="Image" />
		
	</label>
	<g:textField name="image" value="${subSubCollectionInstance?.image}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subSubCollectionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="subSubCollection.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${subSubCollectionInstance?.name}"/>
</div>

