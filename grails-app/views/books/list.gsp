
<%@ page import="com.codebee.products.Books" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'books.label', default: 'Books')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-books" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-books" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="sel_price" title="${message(code: 'books.sel_price.label', default: 'Selprice')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'books.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="list_price" title="${message(code: 'books.list_price.label', default: 'Listprice')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'books.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="image" title="${message(code: 'books.image.label', default: 'Image')}" />
					
						<th><g:message code="books.vendor.label" default="Vendor" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${booksInstanceList}" status="i" var="booksInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${booksInstance.id}">${fieldValue(bean: booksInstance, field: "sel_price")}</g:link></td>
					
						<td>${fieldValue(bean: booksInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: booksInstance, field: "list_price")}</td>
					
						<td>${fieldValue(bean: booksInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: booksInstance, field: "image")}</td>
					
						<td>${fieldValue(bean: booksInstance, field: "vendor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${booksInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
