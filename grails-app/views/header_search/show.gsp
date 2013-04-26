
<%@ page import="com.codebee.themes.Header_search" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'header_search.label', default: 'Header_search')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-header_search" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-header_search" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list header_search">
			
				<g:if test="${header_searchInstance?.box_border_color}">
				<li class="fieldcontain">
					<span id="box_border_color-label" class="property-label"><g:message code="header_search.box_border_color.label" default="Boxbordercolor" /></span>
					
						<span class="property-value" aria-labelledby="box_border_color-label"><g:fieldValue bean="${header_searchInstance}" field="box_border_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_searchInstance?.icon_color}">
				<li class="fieldcontain">
					<span id="icon_color-label" class="property-label"><g:message code="header_search.icon_color.label" default="Iconcolor" /></span>
					
						<span class="property-value" aria-labelledby="icon_color-label"><g:fieldValue bean="${header_searchInstance}" field="icon_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_searchInstance?.show_search}">
				<li class="fieldcontain">
					<span id="show_search-label" class="property-label"><g:message code="header_search.show_search.label" default="Showsearch" /></span>
					
						<span class="property-value" aria-labelledby="show_search-label"><g:formatBoolean boolean="${header_searchInstance?.show_search}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${header_searchInstance?.id}" />
					<g:link class="edit" action="edit" id="${header_searchInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
