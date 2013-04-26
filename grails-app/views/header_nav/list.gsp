
<%@ page import="com.codebee.themes.Header_nav" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'header_nav.label', default: 'Header_nav')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-header_nav" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-header_nav" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="divider_nav_link" title="${message(code: 'header_nav.divider_nav_link.label', default: 'Dividernavlink')}" />
					
						<g:sortableColumn property="drop_menu_bgcolor" title="${message(code: 'header_nav.drop_menu_bgcolor.label', default: 'Dropmenubgcolor')}" />
					
						<g:sortableColumn property="font_size" title="${message(code: 'header_nav.font_size.label', default: 'Fontsize')}" />
					
						<g:sortableColumn property="font_style" title="${message(code: 'header_nav.font_style.label', default: 'Fontstyle')}" />
					
						<g:sortableColumn property="links_Hover_color" title="${message(code: 'header_nav.links_Hover_color.label', default: 'Links Hovercolor')}" />
					
						<g:sortableColumn property="links_color" title="${message(code: 'header_nav.links_color.label', default: 'Linkscolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${header_navInstanceList}" status="i" var="header_navInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${header_navInstance.id}">${fieldValue(bean: header_navInstance, field: "divider_nav_link")}</g:link></td>
					
						<td>${fieldValue(bean: header_navInstance, field: "drop_menu_bgcolor")}</td>
					
						<td>${fieldValue(bean: header_navInstance, field: "font_size")}</td>
					
						<td>${fieldValue(bean: header_navInstance, field: "font_style")}</td>
					
						<td>${fieldValue(bean: header_navInstance, field: "links_Hover_color")}</td>
					
						<td>${fieldValue(bean: header_navInstance, field: "links_color")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${header_navInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
