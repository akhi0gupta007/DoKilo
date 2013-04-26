
<%@ page import="com.codebee.products.CustomCollection" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customCollection.label', default: 'CustomCollection')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customCollection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customCollection" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'customCollection.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="image" title="${message(code: 'customCollection.image.label', default: 'Image')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'customCollection.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customCollectionInstanceList}" status="i" var="customCollectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customCollectionInstance.id}">${fieldValue(bean: customCollectionInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: customCollectionInstance, field: "image")}</td>
					
						<td>${fieldValue(bean: customCollectionInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customCollectionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
