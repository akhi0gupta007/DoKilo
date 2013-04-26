
<%@ page import="com.codebee.themes.Header_logo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'header_logo.label', default: 'Header_logo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-header_logo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-header_logo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list header_logo">
			
				<g:if test="${header_logoInstance?.custom_logo}">
				<li class="fieldcontain">
					<span id="custom_logo-label" class="property-label"><g:message code="header_logo.custom_logo.label" default="Customlogo" /></span>
					
						<span class="property-value" aria-labelledby="custom_logo-label"><g:fieldValue bean="${header_logoInstance}" field="custom_logo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_logoInstance?.font_size}">
				<li class="fieldcontain">
					<span id="font_size-label" class="property-label"><g:message code="header_logo.font_size.label" default="Fontsize" /></span>
					
						<span class="property-value" aria-labelledby="font_size-label"><g:fieldValue bean="${header_logoInstance}" field="font_size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_logoInstance?.font_style}">
				<li class="fieldcontain">
					<span id="font_style-label" class="property-label"><g:message code="header_logo.font_style.label" default="Fontstyle" /></span>
					
						<span class="property-value" aria-labelledby="font_style-label"><g:fieldValue bean="${header_logoInstance}" field="font_style"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_logoInstance?.logo_link_color}">
				<li class="fieldcontain">
					<span id="logo_link_color-label" class="property-label"><g:message code="header_logo.logo_link_color.label" default="Logolinkcolor" /></span>
					
						<span class="property-value" aria-labelledby="logo_link_color-label"><g:fieldValue bean="${header_logoInstance}" field="logo_link_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_logoInstance?.logo_link_color_hover}">
				<li class="fieldcontain">
					<span id="logo_link_color_hover-label" class="property-label"><g:message code="header_logo.logo_link_color_hover.label" default="Logolinkcolorhover" /></span>
					
						<span class="property-value" aria-labelledby="logo_link_color_hover-label"><g:fieldValue bean="${header_logoInstance}" field="logo_link_color_hover"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_logoInstance?.text_image_toggle}">
				<li class="fieldcontain">
					<span id="text_image_toggle-label" class="property-label"><g:message code="header_logo.text_image_toggle.label" default="Textimagetoggle" /></span>
					
						<span class="property-value" aria-labelledby="text_image_toggle-label"><g:formatBoolean boolean="${header_logoInstance?.text_image_toggle}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${header_logoInstance?.id}" />
					<g:link class="edit" action="edit" id="${header_logoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
