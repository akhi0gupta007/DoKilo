
<%@ page import="com.codebee.themes.Header_search" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'header_search.label', default: 'Header_search')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-header_search" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-header_search" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="box_border_color" title="${message(code: 'header_search.box_border_color.label', default: 'Boxbordercolor')}" />
					
						<g:sortableColumn property="icon_color" title="${message(code: 'header_search.icon_color.label', default: 'Iconcolor')}" />
					
						<g:sortableColumn property="show_search" title="${message(code: 'header_search.show_search.label', default: 'Showsearch')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${header_searchInstanceList}" status="i" var="header_searchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${header_searchInstance.id}">${fieldValue(bean: header_searchInstance, field: "box_border_color")}</g:link></td>
					
						<td>${fieldValue(bean: header_searchInstance, field: "icon_color")}</td>
					
						<td><g:formatBoolean boolean="${header_searchInstance.show_search}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${header_searchInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
