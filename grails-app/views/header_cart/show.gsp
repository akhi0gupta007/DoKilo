
<%@ page import="com.codebee.themes.Header_cart" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'header_cart.label', default: 'Header_cart')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-header_cart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-header_cart" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list header_cart">
			
				<g:if test="${header_cartInstance?.bgcolor}">
				<li class="fieldcontain">
					<span id="bgcolor-label" class="property-label"><g:message code="header_cart.bgcolor.label" default="Bgcolor" /></span>
					
						<span class="property-value" aria-labelledby="bgcolor-label"><g:fieldValue bean="${header_cartInstance}" field="bgcolor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_cartInstance?.cart_icon}">
				<li class="fieldcontain">
					<span id="cart_icon-label" class="property-label"><g:message code="header_cart.cart_icon.label" default="Carticon" /></span>
					
						<span class="property-value" aria-labelledby="cart_icon-label"><g:fieldValue bean="${header_cartInstance}" field="cart_icon"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_cartInstance?.divider_color}">
				<li class="fieldcontain">
					<span id="divider_color-label" class="property-label"><g:message code="header_cart.divider_color.label" default="Dividercolor" /></span>
					
						<span class="property-value" aria-labelledby="divider_color-label"><g:fieldValue bean="${header_cartInstance}" field="divider_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_cartInstance?.links_Hover_color}">
				<li class="fieldcontain">
					<span id="links_Hover_color-label" class="property-label"><g:message code="header_cart.links_Hover_color.label" default="Links Hovercolor" /></span>
					
						<span class="property-value" aria-labelledby="links_Hover_color-label"><g:fieldValue bean="${header_cartInstance}" field="links_Hover_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_cartInstance?.links_color}">
				<li class="fieldcontain">
					<span id="links_color-label" class="property-label"><g:message code="header_cart.links_color.label" default="Linkscolor" /></span>
					
						<span class="property-value" aria-labelledby="links_color-label"><g:fieldValue bean="${header_cartInstance}" field="links_color"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${header_cartInstance?.id}" />
					<g:link class="edit" action="edit" id="${header_cartInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
