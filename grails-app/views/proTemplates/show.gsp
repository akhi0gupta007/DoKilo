
<%@ page import="com.codebee.products.ProTemplates" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proTemplates.label', default: 'ProTemplates')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proTemplates" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proTemplates" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proTemplates">
			
				<g:if test="${proTemplatesInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="proTemplates.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${proTemplatesInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${proTemplatesInstance?.nameValuePair}">
				<li class="fieldcontain">
					<span id="nameValuePair-label" class="property-label"><g:message code="proTemplates.nameValuePair.label" default="Name Value Pair" /></span>
					
						<g:each in="${proTemplatesInstance.nameValuePair}" var="n">
						<span class="property-value" aria-labelledby="nameValuePair-label"><g:link controller="nameValuePair" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${proTemplatesInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="proTemplates.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${proTemplatesInstance?.user?.id}">${proTemplatesInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${proTemplatesInstance?.id}" />
					<g:link class="edit" action="edit" id="${proTemplatesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
