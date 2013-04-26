
<%@ page import="com.codebee.themes.Gen_fonts" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gen_fonts.label', default: 'Gen_fonts')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gen_fonts" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gen_fonts" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gen_fonts">
			
				<g:if test="${gen_fontsInstance?.body_font}">
				<li class="fieldcontain">
					<span id="body_font-label" class="property-label"><g:message code="gen_fonts.body_font.label" default="Bodyfont" /></span>
					
						<span class="property-value" aria-labelledby="body_font-label"><g:fieldValue bean="${gen_fontsInstance}" field="body_font"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_fontsInstance?.body_font_size}">
				<li class="fieldcontain">
					<span id="body_font_size-label" class="property-label"><g:message code="gen_fonts.body_font_size.label" default="Bodyfontsize" /></span>
					
						<span class="property-value" aria-labelledby="body_font_size-label"><g:fieldValue bean="${gen_fontsInstance}" field="body_font_size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_fontsInstance?.heading_font}">
				<li class="fieldcontain">
					<span id="heading_font-label" class="property-label"><g:message code="gen_fonts.heading_font.label" default="Headingfont" /></span>
					
						<span class="property-value" aria-labelledby="heading_font-label"><g:fieldValue bean="${gen_fontsInstance}" field="heading_font"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gen_fontsInstance?.id}" />
					<g:link class="edit" action="edit" id="${gen_fontsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
