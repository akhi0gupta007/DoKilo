
<%@ page import="com.codebee.themes.Right_linklist" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right_linklist.label', default: 'Right_linklist')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-right_linklist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-right_linklist" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list right_linklist">
			
				<g:if test="${right_linklistInstance?.collection_title}">
				<li class="fieldcontain">
					<span id="collection_title-label" class="property-label"><g:message code="right_linklist.collection_title.label" default="Collectiontitle" /></span>
					
						<span class="property-value" aria-labelledby="collection_title-label"><g:fieldValue bean="${right_linklistInstance}" field="collection_title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_linklistInstance?.show_all_collection}">
				<li class="fieldcontain">
					<span id="show_all_collection-label" class="property-label"><g:message code="right_linklist.show_all_collection.label" default="Showallcollection" /></span>
					
						<span class="property-value" aria-labelledby="show_all_collection-label"><g:formatBoolean boolean="${right_linklistInstance?.show_all_collection}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_linklistInstance?.show_all_vendor}">
				<li class="fieldcontain">
					<span id="show_all_vendor-label" class="property-label"><g:message code="right_linklist.show_all_vendor.label" default="Showallvendor" /></span>
					
						<span class="property-value" aria-labelledby="show_all_vendor-label"><g:formatBoolean boolean="${right_linklistInstance?.show_all_vendor}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_linklistInstance?.vendor_title}">
				<li class="fieldcontain">
					<span id="vendor_title-label" class="property-label"><g:message code="right_linklist.vendor_title.label" default="Vendortitle" /></span>
					
						<span class="property-value" aria-labelledby="vendor_title-label"><g:fieldValue bean="${right_linklistInstance}" field="vendor_title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${right_linklistInstance?.id}" />
					<g:link class="edit" action="edit" id="${right_linklistInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
