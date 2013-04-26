
<%@ page import="com.codebee.themes.Header_nav" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'header_nav.label', default: 'Header_nav')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-header_nav" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-header_nav" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list header_nav">
			
				<g:if test="${header_navInstance?.divider_nav_link}">
				<li class="fieldcontain">
					<span id="divider_nav_link-label" class="property-label"><g:message code="header_nav.divider_nav_link.label" default="Dividernavlink" /></span>
					
						<span class="property-value" aria-labelledby="divider_nav_link-label"><g:fieldValue bean="${header_navInstance}" field="divider_nav_link"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_navInstance?.drop_menu_bgcolor}">
				<li class="fieldcontain">
					<span id="drop_menu_bgcolor-label" class="property-label"><g:message code="header_nav.drop_menu_bgcolor.label" default="Dropmenubgcolor" /></span>
					
						<span class="property-value" aria-labelledby="drop_menu_bgcolor-label"><g:fieldValue bean="${header_navInstance}" field="drop_menu_bgcolor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_navInstance?.font_size}">
				<li class="fieldcontain">
					<span id="font_size-label" class="property-label"><g:message code="header_nav.font_size.label" default="Fontsize" /></span>
					
						<span class="property-value" aria-labelledby="font_size-label"><g:fieldValue bean="${header_navInstance}" field="font_size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_navInstance?.font_style}">
				<li class="fieldcontain">
					<span id="font_style-label" class="property-label"><g:message code="header_nav.font_style.label" default="Fontstyle" /></span>
					
						<span class="property-value" aria-labelledby="font_style-label"><g:fieldValue bean="${header_navInstance}" field="font_style"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_navInstance?.links_Hover_color}">
				<li class="fieldcontain">
					<span id="links_Hover_color-label" class="property-label"><g:message code="header_nav.links_Hover_color.label" default="Links Hovercolor" /></span>
					
						<span class="property-value" aria-labelledby="links_Hover_color-label"><g:fieldValue bean="${header_navInstance}" field="links_Hover_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_navInstance?.links_color}">
				<li class="fieldcontain">
					<span id="links_color-label" class="property-label"><g:message code="header_nav.links_color.label" default="Linkscolor" /></span>
					
						<span class="property-value" aria-labelledby="links_color-label"><g:fieldValue bean="${header_navInstance}" field="links_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${header_navInstance?.menu_border_color}">
				<li class="fieldcontain">
					<span id="menu_border_color-label" class="property-label"><g:message code="header_nav.menu_border_color.label" default="Menubordercolor" /></span>
					
						<span class="property-value" aria-labelledby="menu_border_color-label"><g:fieldValue bean="${header_navInstance}" field="menu_border_color"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${header_navInstance?.id}" />
					<g:link class="edit" action="edit" id="${header_navInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
