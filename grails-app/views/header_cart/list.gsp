
<%@ page import="com.codebee.themes.Header_cart" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'header_cart.label', default: 'Header_cart')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-header_cart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-header_cart" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="bgcolor" title="${message(code: 'header_cart.bgcolor.label', default: 'Bgcolor')}" />
					
						<g:sortableColumn property="cart_icon" title="${message(code: 'header_cart.cart_icon.label', default: 'Carticon')}" />
					
						<g:sortableColumn property="divider_color" title="${message(code: 'header_cart.divider_color.label', default: 'Dividercolor')}" />
					
						<g:sortableColumn property="links_Hover_color" title="${message(code: 'header_cart.links_Hover_color.label', default: 'Links Hovercolor')}" />
					
						<g:sortableColumn property="links_color" title="${message(code: 'header_cart.links_color.label', default: 'Linkscolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${header_cartInstanceList}" status="i" var="header_cartInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${header_cartInstance.id}">${fieldValue(bean: header_cartInstance, field: "bgcolor")}</g:link></td>
					
						<td>${fieldValue(bean: header_cartInstance, field: "cart_icon")}</td>
					
						<td>${fieldValue(bean: header_cartInstance, field: "divider_color")}</td>
					
						<td>${fieldValue(bean: header_cartInstance, field: "links_Hover_color")}</td>
					
						<td>${fieldValue(bean: header_cartInstance, field: "links_color")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${header_cartInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
