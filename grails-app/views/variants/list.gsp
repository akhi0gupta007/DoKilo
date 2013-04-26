
<%@ page import="com.codebee.products.Variants" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'variants.label', default: 'Variants')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-variants" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-variants" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="size" title="${message(code: 'variants.size.label', default: 'Size')}" />
					
						<g:sortableColumn property="color" title="${message(code: 'variants.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="mat" title="${message(code: 'variants.mat.label', default: 'Mat')}" />
					
						<g:sortableColumn property="style" title="${message(code: 'variants.style.label', default: 'Style')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'variants.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${variantsInstanceList}" status="i" var="variantsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${variantsInstance.id}">${fieldValue(bean: variantsInstance, field: "size")}</g:link></td>
					
						<td>${fieldValue(bean: variantsInstance, field: "color")}</td>
					
						<td>${fieldValue(bean: variantsInstance, field: "mat")}</td>
					
						<td>${fieldValue(bean: variantsInstance, field: "style")}</td>
					
						<td>${fieldValue(bean: variantsInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${variantsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
