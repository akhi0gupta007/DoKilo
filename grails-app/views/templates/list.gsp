
<%@ page import="com.codebee.themes.Templates" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templates.label', default: 'Templates')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-templates" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-templates" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="css" title="${message(code: 'templates.css.label', default: 'Css')}" />
					
						<g:sortableColumn property="logo" title="${message(code: 'templates.logo.label', default: 'Logo')}" />
					
						<g:sortableColumn property="storeName" title="${message(code: 'templates.storeName.label', default: 'Store Name')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'templates.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'templates.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enable" title="${message(code: 'templates.enable.label', default: 'Enable')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${templatesInstanceList}" status="i" var="templatesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${templatesInstance.id}">${fieldValue(bean: templatesInstance, field: "css")}</g:link></td>
					
						<td>${fieldValue(bean: templatesInstance, field: "logo")}</td>
					
						<td>${fieldValue(bean: templatesInstance, field: "storeName")}</td>
					
						<td>${fieldValue(bean: templatesInstance, field: "name")}</td>
					
						<td><g:formatDate date="${templatesInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${templatesInstance.enable}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${templatesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
