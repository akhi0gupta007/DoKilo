
<%@ page import="com.codebee.themes.Right_welcome" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right_welcome.label', default: 'Right_welcome')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-right_welcome" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-right_welcome" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="show_widget" title="${message(code: 'right_welcome.show_widget.label', default: 'Showwidget')}" />
					
						<g:sortableColumn property="wel_desc" title="${message(code: 'right_welcome.wel_desc.label', default: 'Weldesc')}" />
					
						<g:sortableColumn property="wel_title" title="${message(code: 'right_welcome.wel_title.label', default: 'Weltitle')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${right_welcomeInstanceList}" status="i" var="right_welcomeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${right_welcomeInstance.id}">${fieldValue(bean: right_welcomeInstance, field: "show_widget")}</g:link></td>
					
						<td>${fieldValue(bean: right_welcomeInstance, field: "wel_desc")}</td>
					
						<td>${fieldValue(bean: right_welcomeInstance, field: "wel_title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${right_welcomeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
