
<%@ page import="com.codebee.products.SubCollection" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subCollection.label', default: 'SubCollection')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subCollection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subCollection" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subCollection">
			
				<g:if test="${subCollectionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="subCollection.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${subCollectionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subCollectionInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="subCollection.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${subCollectionInstance}" field="image"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subCollectionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="subCollection.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${subCollectionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subCollectionInstance?.subSubCollection}">
				<li class="fieldcontain">
					<span id="subSubCollection-label" class="property-label"><g:message code="subCollection.subSubCollection.label" default="Sub Sub Collection" /></span>
					
						<g:each in="${subCollectionInstance.subSubCollection}" var="s">
						<span class="property-value" aria-labelledby="subSubCollection-label"><g:link controller="subSubCollection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subCollectionInstance?.id}" />
					<g:link class="edit" action="edit" id="${subCollectionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
