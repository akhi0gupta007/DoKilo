
<%@ page import="com.codebee.themes.Homepage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'homepage.label', default: 'Homepage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-homepage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-homepage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list homepage">
			
				<g:if test="${homepageInstance?.max_no_items}">
				<li class="fieldcontain">
					<span id="max_no_items-label" class="property-label"><g:message code="homepage.max_no_items.label" default="Maxnoitems" /></span>
					
						<span class="property-value" aria-labelledby="max_no_items-label"><g:fieldValue bean="${homepageInstance}" field="max_no_items"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${homepageInstance?.collection}">
				<li class="fieldcontain">
					<span id="collection-label" class="property-label"><g:message code="homepage.collection.label" default="Collection" /></span>
					
						<g:each in="${homepageInstance.collection}" var="c">
						<span class="property-value" aria-labelledby="collection-label"><g:link controller="customCollection" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${homepageInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="homepage.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:fieldValue bean="${homepageInstance}" field="product"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${homepageInstance?.show_collection_name}">
				<li class="fieldcontain">
					<span id="show_collection_name-label" class="property-label"><g:message code="homepage.show_collection_name.label" default="Showcollectionname" /></span>
					
						<span class="property-value" aria-labelledby="show_collection_name-label"><g:formatBoolean boolean="${homepageInstance?.show_collection_name}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${homepageInstance?.show_desc}">
				<li class="fieldcontain">
					<span id="show_desc-label" class="property-label"><g:message code="homepage.show_desc.label" default="Showdesc" /></span>
					
						<span class="property-value" aria-labelledby="show_desc-label"><g:formatBoolean boolean="${homepageInstance?.show_desc}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${homepageInstance?.smartColl}">
				<li class="fieldcontain">
					<span id="smartColl-label" class="property-label"><g:message code="homepage.smartColl.label" default="Smart Coll" /></span>
					
						<span class="property-value" aria-labelledby="smartColl-label"><g:formatBoolean boolean="${homepageInstance?.smartColl}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${homepageInstance?.smartcollection}">
				<li class="fieldcontain">
					<span id="smartcollection-label" class="property-label"><g:message code="homepage.smartcollection.label" default="Smartcollection" /></span>
					
						<g:each in="${homepageInstance.smartcollection}" var="s">
						<span class="property-value" aria-labelledby="smartcollection-label"><g:link controller="smartCollection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${homepageInstance?.id}" />
					<g:link class="edit" action="edit" id="${homepageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
