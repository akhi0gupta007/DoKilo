
<%@ page import="com.codebee.themes.Header_logo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'header_logo.label', default: 'Header_logo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-header_logo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-header_logo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="custom_logo" title="${message(code: 'header_logo.custom_logo.label', default: 'Customlogo')}" />
					
						<g:sortableColumn property="font_size" title="${message(code: 'header_logo.font_size.label', default: 'Fontsize')}" />
					
						<g:sortableColumn property="font_style" title="${message(code: 'header_logo.font_style.label', default: 'Fontstyle')}" />
					
						<g:sortableColumn property="logo_link_color" title="${message(code: 'header_logo.logo_link_color.label', default: 'Logolinkcolor')}" />
					
						<g:sortableColumn property="logo_link_color_hover" title="${message(code: 'header_logo.logo_link_color_hover.label', default: 'Logolinkcolorhover')}" />
					
						<g:sortableColumn property="text_image_toggle" title="${message(code: 'header_logo.text_image_toggle.label', default: 'Textimagetoggle')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${header_logoInstanceList}" status="i" var="header_logoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${header_logoInstance.id}">${fieldValue(bean: header_logoInstance, field: "custom_logo")}</g:link></td>
					
						<td>${fieldValue(bean: header_logoInstance, field: "font_size")}</td>
					
						<td>${fieldValue(bean: header_logoInstance, field: "font_style")}</td>
					
						<td>${fieldValue(bean: header_logoInstance, field: "logo_link_color")}</td>
					
						<td>${fieldValue(bean: header_logoInstance, field: "logo_link_color_hover")}</td>
					
						<td><g:formatBoolean boolean="${header_logoInstance.text_image_toggle}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${header_logoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
