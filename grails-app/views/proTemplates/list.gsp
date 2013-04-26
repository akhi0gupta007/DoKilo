
<%@ page import="com.codebee.products.ProTemplates" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proTemplates.label', default: 'ProTemplates')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-proTemplates" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-proTemplates" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'proTemplates.name.label', default: 'Name')}" />
					
						<th><g:message code="proTemplates.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${proTemplatesInstanceList}" status="i" var="proTemplatesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${proTemplatesInstance.id}">${fieldValue(bean: proTemplatesInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: proTemplatesInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${proTemplatesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
