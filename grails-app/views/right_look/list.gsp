
<%@ page import="com.codebee.themes.Right_look" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right_look.label', default: 'Right_look')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-right_look" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-right_look" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="div_color_hov" title="${message(code: 'right_look.div_color_hov.label', default: 'Divcolorhov')}" />
					
						<g:sortableColumn property="link_color" title="${message(code: 'right_look.link_color.label', default: 'Linkcolor')}" />
					
						<g:sortableColumn property="link_color_hov" title="${message(code: 'right_look.link_color_hov.label', default: 'Linkcolorhov')}" />
					
						<g:sortableColumn property="show_right" title="${message(code: 'right_look.show_right.label', default: 'Showright')}" />
					
						<g:sortableColumn property="text_color" title="${message(code: 'right_look.text_color.label', default: 'Textcolor')}" />
					
						<g:sortableColumn property="widget_bgcolor" title="${message(code: 'right_look.widget_bgcolor.label', default: 'Widgetbgcolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${right_lookInstanceList}" status="i" var="right_lookInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${right_lookInstance.id}">${fieldValue(bean: right_lookInstance, field: "div_color_hov")}</g:link></td>
					
						<td>${fieldValue(bean: right_lookInstance, field: "link_color")}</td>
					
						<td>${fieldValue(bean: right_lookInstance, field: "link_color_hov")}</td>
					
						<td><g:formatBoolean boolean="${right_lookInstance.show_right}" /></td>
					
						<td>${fieldValue(bean: right_lookInstance, field: "text_color")}</td>
					
						<td>${fieldValue(bean: right_lookInstance, field: "widget_bgcolor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${right_lookInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
