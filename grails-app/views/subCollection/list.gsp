
<%@ page import="com.codebee.products.SubCollection" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subCollection.label', default: 'SubCollection')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subCollection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subCollection" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'subCollection.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="image" title="${message(code: 'subCollection.image.label', default: 'Image')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'subCollection.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subCollectionInstanceList}" status="i" var="subCollectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subCollectionInstance.id}">${fieldValue(bean: subCollectionInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: subCollectionInstance, field: "image")}</td>
					
						<td>${fieldValue(bean: subCollectionInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subCollectionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
