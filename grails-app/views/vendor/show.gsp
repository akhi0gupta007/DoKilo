
<%@ page import="com.codebee.products.Vendor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vendor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vendor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vendor">
			
				<g:if test="${vendorInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="vendor.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${vendorInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendorInstance?.ven_name}">
				<li class="fieldcontain">
					<span id="ven_name-label" class="property-label"><g:message code="vendor.ven_name.label" default="Venname" /></span>
					
						<span class="property-value" aria-labelledby="ven_name-label"><g:fieldValue bean="${vendorInstance}" field="ven_name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendorInstance?.website}">
				<li class="fieldcontain">
					<span id="website-label" class="property-label"><g:message code="vendor.website.label" default="Website" /></span>
					
						<span class="property-value" aria-labelledby="website-label"><g:fieldValue bean="${vendorInstance}" field="website"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendorInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="vendor.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${vendorInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vendorInstance?.id}" />
					<g:link class="edit" action="edit" id="${vendorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
