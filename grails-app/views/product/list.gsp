
<%@ page import="com.codebee.products.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-product" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="sel_price" title="${message(code: 'product.sel_price.label', default: 'Selprice')}" />
					
						<g:sortableColumn property="list_price" title="${message(code: 'product.list_price.label', default: 'Listprice')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="image" title="${message(code: 'product.image.label', default: 'Image')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'product.title.label', default: 'Title')}" />
					
						<th><g:message code="product.vendor.label" default="Vendor" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "sel_price")}</g:link></td>
					
						<td>${fieldValue(bean: productInstance, field: "list_price")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "image")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "vendor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
