
<%@ page import="com.codebee.themes.Homepage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'homepage.label', default: 'Homepage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-homepage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-homepage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="max_no_items" title="${message(code: 'homepage.max_no_items.label', default: 'Maxnoitems')}" />
					
						<g:sortableColumn property="product" title="${message(code: 'homepage.product.label', default: 'Product')}" />
					
						<g:sortableColumn property="show_collection_name" title="${message(code: 'homepage.show_collection_name.label', default: 'Showcollectionname')}" />
					
						<g:sortableColumn property="show_desc" title="${message(code: 'homepage.show_desc.label', default: 'Showdesc')}" />
					
						<g:sortableColumn property="smartColl" title="${message(code: 'homepage.smartColl.label', default: 'Smart Coll')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${homepageInstanceList}" status="i" var="homepageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${homepageInstance.id}">${fieldValue(bean: homepageInstance, field: "max_no_items")}</g:link></td>
					
						<td>${fieldValue(bean: homepageInstance, field: "product")}</td>
					
						<td><g:formatBoolean boolean="${homepageInstance.show_collection_name}" /></td>
					
						<td><g:formatBoolean boolean="${homepageInstance.show_desc}" /></td>
					
						<td><g:formatBoolean boolean="${homepageInstance.smartColl}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${homepageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
