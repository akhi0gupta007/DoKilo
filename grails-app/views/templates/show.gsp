
<%@ page import="com.codebee.themes.Templates" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templates.label', default: 'Templates')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-templates" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-templates" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list templates">
			
				<g:if test="${templatesInstance?.css}">
				<li class="fieldcontain">
					<span id="css-label" class="property-label"><g:message code="templates.css.label" default="Css" /></span>
					
						<span class="property-value" aria-labelledby="css-label"><g:fieldValue bean="${templatesInstance}" field="css"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templatesInstance?.logo}">
				<li class="fieldcontain">
					<span id="logo-label" class="property-label"><g:message code="templates.logo.label" default="Logo" /></span>
					
						<span class="property-value" aria-labelledby="logo-label"><g:fieldValue bean="${templatesInstance}" field="logo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templatesInstance?.storeName}">
				<li class="fieldcontain">
					<span id="storeName-label" class="property-label"><g:message code="templates.storeName.label" default="Store Name" /></span>
					
						<span class="property-value" aria-labelledby="storeName-label"><g:fieldValue bean="${templatesInstance}" field="storeName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templatesInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="templates.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${templatesInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templatesInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="templates.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${templatesInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${templatesInstance?.enable}">
				<li class="fieldcontain">
					<span id="enable-label" class="property-label"><g:message code="templates.enable.label" default="Enable" /></span>
					
						<span class="property-value" aria-labelledby="enable-label"><g:formatBoolean boolean="${templatesInstance?.enable}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${templatesInstance?.id}" />
					<g:link class="edit" action="edit" id="${templatesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
