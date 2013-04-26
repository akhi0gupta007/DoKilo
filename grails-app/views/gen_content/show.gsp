
<%@ page import="com.codebee.themes.Gen_content" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gen_content.label', default: 'Gen_content')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gen_content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gen_content" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gen_content">
			
				<g:if test="${gen_contentInstance?.bgcolor_color}">
				<li class="fieldcontain">
					<span id="bgcolor_color-label" class="property-label"><g:message code="gen_content.bgcolor_color.label" default="Bgcolorcolor" /></span>
					
						<span class="property-value" aria-labelledby="bgcolor_color-label"><g:fieldValue bean="${gen_contentInstance}" field="bgcolor_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_contentInstance?.headers_color}">
				<li class="fieldcontain">
					<span id="headers_color-label" class="property-label"><g:message code="gen_content.headers_color.label" default="Headerscolor" /></span>
					
						<span class="property-value" aria-labelledby="headers_color-label"><g:fieldValue bean="${gen_contentInstance}" field="headers_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_contentInstance?.links_Hover_color}">
				<li class="fieldcontain">
					<span id="links_Hover_color-label" class="property-label"><g:message code="gen_content.links_Hover_color.label" default="Links Hovercolor" /></span>
					
						<span class="property-value" aria-labelledby="links_Hover_color-label"><g:fieldValue bean="${gen_contentInstance}" field="links_Hover_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_contentInstance?.links_color}">
				<li class="fieldcontain">
					<span id="links_color-label" class="property-label"><g:message code="gen_content.links_color.label" default="Linkscolor" /></span>
					
						<span class="property-value" aria-labelledby="links_color-label"><g:fieldValue bean="${gen_contentInstance}" field="links_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_contentInstance?.sec_color}">
				<li class="fieldcontain">
					<span id="sec_color-label" class="property-label"><g:message code="gen_content.sec_color.label" default="Seccolor" /></span>
					
						<span class="property-value" aria-labelledby="sec_color-label"><g:fieldValue bean="${gen_contentInstance}" field="sec_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_contentInstance?.table_header_color}">
				<li class="fieldcontain">
					<span id="table_header_color-label" class="property-label"><g:message code="gen_content.table_header_color.label" default="Tableheadercolor" /></span>
					
						<span class="property-value" aria-labelledby="table_header_color-label"><g:fieldValue bean="${gen_contentInstance}" field="table_header_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gen_contentInstance?.text_color}">
				<li class="fieldcontain">
					<span id="text_color-label" class="property-label"><g:message code="gen_content.text_color.label" default="Textcolor" /></span>
					
						<span class="property-value" aria-labelledby="text_color-label"><g:fieldValue bean="${gen_contentInstance}" field="text_color"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gen_contentInstance?.id}" />
					<g:link class="edit" action="edit" id="${gen_contentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
