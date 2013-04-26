
<%@ page import="com.codebee.themes.Right_linklist" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right_linklist.label', default: 'Right_linklist')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-right_linklist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-right_linklist" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="collection_title" title="${message(code: 'right_linklist.collection_title.label', default: 'Collectiontitle')}" />
					
						<g:sortableColumn property="show_all_collection" title="${message(code: 'right_linklist.show_all_collection.label', default: 'Showallcollection')}" />
					
						<g:sortableColumn property="show_all_vendor" title="${message(code: 'right_linklist.show_all_vendor.label', default: 'Showallvendor')}" />
					
						<g:sortableColumn property="vendor_title" title="${message(code: 'right_linklist.vendor_title.label', default: 'Vendortitle')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${right_linklistInstanceList}" status="i" var="right_linklistInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${right_linklistInstance.id}">${fieldValue(bean: right_linklistInstance, field: "collection_title")}</g:link></td>
					
						<td><g:formatBoolean boolean="${right_linklistInstance.show_all_collection}" /></td>
					
						<td><g:formatBoolean boolean="${right_linklistInstance.show_all_vendor}" /></td>
					
						<td>${fieldValue(bean: right_linklistInstance, field: "vendor_title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${right_linklistInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
