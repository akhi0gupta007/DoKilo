
<%@ page import="com.codebee.logistics.Shipping" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shipping.label', default: 'Shipping')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shipping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shipping" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="plan" title="${message(code: 'shipping.plan.label', default: 'Plan')}" />
					
						<g:sortableColumn property="lo_price" title="${message(code: 'shipping.lo_price.label', default: 'Loprice')}" />
					
						<g:sortableColumn property="lo_wt" title="${message(code: 'shipping.lo_wt.label', default: 'Lowt')}" />
					
						<g:sortableColumn property="up_price" title="${message(code: 'shipping.up_price.label', default: 'Upprice')}" />
					
						<g:sortableColumn property="up_wt" title="${message(code: 'shipping.up_wt.label', default: 'Upwt')}" />
					
						<g:sortableColumn property="wt_based" title="${message(code: 'shipping.wt_based.label', default: 'Wtbased')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${shippingInstanceList}" status="i" var="shippingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${shippingInstance.id}">${fieldValue(bean: shippingInstance, field: "plan")}</g:link></td>
					
						<td>${fieldValue(bean: shippingInstance, field: "lo_price")}</td>
					
						<td>${fieldValue(bean: shippingInstance, field: "lo_wt")}</td>
					
						<td>${fieldValue(bean: shippingInstance, field: "up_price")}</td>
					
						<td>${fieldValue(bean: shippingInstance, field: "up_wt")}</td>
					
						<td><g:formatBoolean boolean="${shippingInstance.wt_based}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${shippingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
