
<%@ page import="com.codebee.themes.Gen_button" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gen_button.label', default: 'Gen_button')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gen_button" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gen_button" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gen_button">
			
				<g:if test="${gen_buttonInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="gen_button.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${gen_buttonInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_buttonInstance?.color_hover}">
				<li class="fieldcontain">
					<span id="color_hover-label" class="property-label"><g:message code="gen_button.color_hover.label" default="Colorhover" /></span>
					
						<span class="property-value" aria-labelledby="color_hover-label"><g:fieldValue bean="${gen_buttonInstance}" field="color_hover"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_buttonInstance?.text_color}">
				<li class="fieldcontain">
					<span id="text_color-label" class="property-label"><g:message code="gen_button.text_color.label" default="Textcolor" /></span>
					
						<span class="property-value" aria-labelledby="text_color-label"><g:fieldValue bean="${gen_buttonInstance}" field="text_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_buttonInstance?.text_color_hover}">
				<li class="fieldcontain">
					<span id="text_color_hover-label" class="property-label"><g:message code="gen_button.text_color_hover.label" default="Textcolorhover" /></span>
					
						<span class="property-value" aria-labelledby="text_color_hover-label"><g:fieldValue bean="${gen_buttonInstance}" field="text_color_hover"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gen_buttonInstance?.id}" />
					<g:link class="edit" action="edit" id="${gen_buttonInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
