<%@ page import="com.codebee.products.SubCollection" %>



<div class="fieldcontain ${hasErrors(bean: subCollectionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="subCollection.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" required="" value="${subCollectionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subCollectionInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="subCollection.image.label" default="Image" />
		
	</label>
	<g:textField name="image" value="${subCollectionInstance?.image}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subCollectionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="subCollection.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${subCollectionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subCollectionInstance, field: 'subSubCollection', 'error')} ">
	<label for="subSubCollection">
		<g:message code="subCollection.subSubCollection.label" default="Sub Sub Collection" />
		
	</label>
	<g:select name="subSubCollection" from="${com.codebee.products.SubSubCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${subCollectionInstance?.subSubCollection*.id}" class="many-to-many"/>
</div>

