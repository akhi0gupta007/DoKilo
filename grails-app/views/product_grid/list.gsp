
<%@ page import="com.codebee.themes.Product_grid" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product_grid.label', default: 'Product_grid')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-product_grid" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-product_grid" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="bgcolor_behind_name" title="${message(code: 'product_grid.bgcolor_behind_name.label', default: 'Bgcolorbehindname')}" />
					
						<g:sortableColumn property="bgcolor_price_color" title="${message(code: 'product_grid.bgcolor_price_color.label', default: 'Bgcolorpricecolor')}" />
					
						<g:sortableColumn property="header_color" title="${message(code: 'product_grid.header_color.label', default: 'Headercolor')}" />
					
						<g:sortableColumn property="header_font_size" title="${message(code: 'product_grid.header_font_size.label', default: 'Headerfontsize')}" />
					
						<g:sortableColumn property="header_font_style" title="${message(code: 'product_grid.header_font_style.label', default: 'Headerfontstyle')}" />
					
						<g:sortableColumn property="link_color" title="${message(code: 'product_grid.link_color.label', default: 'Linkcolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${product_gridInstanceList}" status="i" var="product_gridInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${product_gridInstance.id}">${fieldValue(bean: product_gridInstance, field: "bgcolor_behind_name")}</g:link></td>
					
						<td>${fieldValue(bean: product_gridInstance, field: "bgcolor_price_color")}</td>
					
						<td>${fieldValue(bean: product_gridInstance, field: "header_color")}</td>
					
						<td>${fieldValue(bean: product_gridInstance, field: "header_font_size")}</td>
					
						<td>${fieldValue(bean: product_gridInstance, field: "header_font_style")}</td>
					
						<td>${fieldValue(bean: product_gridInstance, field: "link_color")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${product_gridInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
