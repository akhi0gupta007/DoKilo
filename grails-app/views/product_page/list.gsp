
<%@ page import="com.codebee.themes.Product_page" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product_page.label', default: 'Product_page')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-product_page" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-product_page" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="addedtoCart_color" title="${message(code: 'product_page.addedtoCart_color.label', default: 'Addedto Cartcolor')}" />
					
						<g:sortableColumn property="fb_like" title="${message(code: 'product_page.fb_like.label', default: 'Fblike')}" />
					
						<g:sortableColumn property="google_plusone" title="${message(code: 'product_page.google_plusone.label', default: 'Googleplusone')}" />
					
						<g:sortableColumn property="numof_collection_items" title="${message(code: 'product_page.numof_collection_items.label', default: 'Numofcollectionitems')}" />
					
						<g:sortableColumn property="price_color" title="${message(code: 'product_page.price_color.label', default: 'Pricecolor')}" />
					
						<g:sortableColumn property="product_name_font" title="${message(code: 'product_page.product_name_font.label', default: 'Productnamefont')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${product_pageInstanceList}" status="i" var="product_pageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${product_pageInstance.id}">${fieldValue(bean: product_pageInstance, field: "addedtoCart_color")}</g:link></td>
					
						<td><g:formatBoolean boolean="${product_pageInstance.fb_like}" /></td>
					
						<td><g:formatBoolean boolean="${product_pageInstance.google_plusone}" /></td>
					
						<td>${fieldValue(bean: product_pageInstance, field: "numof_collection_items")}</td>
					
						<td>${fieldValue(bean: product_pageInstance, field: "price_color")}</td>
					
						<td>${fieldValue(bean: product_pageInstance, field: "product_name_font")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${product_pageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
