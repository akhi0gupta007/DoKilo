<%@ page import="com.codebee.themes.Templates" %>



<div class="fieldcontain ${hasErrors(bean: templatesInstance, field: 'css', 'error')} required">
	<label for="css">
		<g:message code="templates.css.label" default="Css" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="css" required="" value="${templatesInstance?.css}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templatesInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="templates.logo.label" default="Logo" />
		
	</label>
	<g:textField name="logo" value="${templatesInstance?.logo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templatesInstance, field: 'storeName', 'error')} ">
	<label for="storeName">
		<g:message code="templates.storeName.label" default="Store Name" />
		
	</label>
	<g:textField name="storeName" value="${templatesInstance?.storeName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templatesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="templates.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${templatesInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templatesInstance, field: 'enable', 'error')} ">
	<label for="enable">
		<g:message code="templates.enable.label" default="Enable" />
		
	</label>
	<g:checkBox name="enable" value="${templatesInstance?.enable}" />
</div>

