
<%@ page import="com.codebee.products.Variants" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'variants.label', default: 'Variants')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-variants" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-variants" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list variants">
			
				<g:if test="${variantsInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="variants.size.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${variantsInstance}" field="size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantsInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="variants.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${variantsInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantsInstance?.mat}">
				<li class="fieldcontain">
					<span id="mat-label" class="property-label"><g:message code="variants.mat.label" default="Mat" /></span>
					
						<span class="property-value" aria-labelledby="mat-label"><g:fieldValue bean="${variantsInstance}" field="mat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantsInstance?.style}">
				<li class="fieldcontain">
					<span id="style-label" class="property-label"><g:message code="variants.style.label" default="Style" /></span>
					
						<span class="property-value" aria-labelledby="style-label"><g:fieldValue bean="${variantsInstance}" field="style"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantsInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="variants.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${variantsInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${variantsInstance?.customVariant}">
				<li class="fieldcontain">
					<span id="customVariant-label" class="property-label"><g:message code="variants.customVariant.label" default="Custom Variant" /></span>
					
						<g:each in="${variantsInstance.customVariant}" var="c">
						<span class="property-value" aria-labelledby="customVariant-label"><g:link controller="customVariant" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${variantsInstance?.id}" />
					<g:link class="edit" action="edit" id="${variantsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
