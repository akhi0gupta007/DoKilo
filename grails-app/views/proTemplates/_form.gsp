<%@ page import="com.codebee.products.ProTemplates" %>



<div class="fieldcontain ${hasErrors(bean: proTemplatesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="proTemplates.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${proTemplatesInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proTemplatesInstance, field: 'nameValuePair', 'error')} ">
	<label for="nameValuePair">
		<g:message code="proTemplates.nameValuePair.label" default="Name Value Pair" />
		
	</label>
	<g:select name="nameValuePair" from="${com.codebee.products.NameValuePair.list()}" multiple="multiple" optionKey="id" size="5" value="${proTemplatesInstance?.nameValuePair*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proTemplatesInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="proTemplates.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.codebee.User.list()}" optionKey="id" required="" value="${proTemplatesInstance?.user?.id}" class="many-to-one"/>
</div>

