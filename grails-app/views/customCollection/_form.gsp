<%@ page import="com.codebee.products.CustomCollection" %>



<div class="fieldcontain ${hasErrors(bean: customCollectionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="customCollection.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" required="" value="${customCollectionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customCollectionInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="customCollection.image.label" default="Image" />
		
	</label>
	<g:textField name="image" value="${customCollectionInstance?.image}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customCollectionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="customCollection.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${customCollectionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customCollectionInstance, field: 'subCollection', 'error')} ">
	<label for="subCollection">
		<g:message code="customCollection.subCollection.label" default="Sub Collection" />
		
	</label>
	<g:select name="subCollection" from="${com.codebee.products.SubCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${customCollectionInstance?.subCollection*.id}" class="many-to-many"/>
</div>

