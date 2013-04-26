
<%@ page import="com.codebee.products.Vendor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vendor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vendor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'vendor.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="ven_name" title="${message(code: 'vendor.ven_name.label', default: 'Venname')}" />
					
						<g:sortableColumn property="website" title="${message(code: 'vendor.website.label', default: 'Website')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'vendor.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vendorInstanceList}" status="i" var="vendorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vendorInstance.id}">${fieldValue(bean: vendorInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: vendorInstance, field: "ven_name")}</td>
					
						<td>${fieldValue(bean: vendorInstance, field: "website")}</td>
					
						<td><g:formatDate date="${vendorInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vendorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
