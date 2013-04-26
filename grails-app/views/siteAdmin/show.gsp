
<%@ page import="com.codebee.SiteAdmin" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteAdmin.label', default: 'SiteAdmin')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-siteAdmin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-siteAdmin" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list siteAdmin">
			
				<g:if test="${siteAdminInstance?.userId}">
				<li class="fieldcontain">
					<span id="userId-label" class="property-label"><g:message code="siteAdmin.userId.label" default="User Id" /></span>
					
						<span class="property-value" aria-labelledby="userId-label"><g:fieldValue bean="${siteAdminInstance}" field="userId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteAdminInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="siteAdmin.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${siteAdminInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteAdminInstance?.emailId}">
				<li class="fieldcontain">
					<span id="emailId-label" class="property-label"><g:message code="siteAdmin.emailId.label" default="Email Id" /></span>
					
						<span class="property-value" aria-labelledby="emailId-label"><g:fieldValue bean="${siteAdminInstance}" field="emailId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteAdminInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="siteAdmin.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${siteAdminInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteAdminInstance?.templates}">
				<li class="fieldcontain">
					<span id="templates-label" class="property-label"><g:message code="siteAdmin.templates.label" default="Templates" /></span>
					
						<g:each in="${siteAdminInstance.templates}" var="t">
						<span class="property-value" aria-labelledby="templates-label"><g:link controller="templates" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${siteAdminInstance?.id}" />
					<g:link class="edit" action="edit" id="${siteAdminInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
