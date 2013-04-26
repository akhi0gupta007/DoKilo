
<%@ page import="com.codebee.products.XlsUploader" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'xlsUploader.label', default: 'XlsUploader')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-xlsUploader" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-xlsUploader" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="path" title="${message(code: 'xlsUploader.path.label', default: 'Path')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'xlsUploader.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${xlsUploaderInstanceList}" status="i" var="xlsUploaderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${xlsUploaderInstance.id}">${fieldValue(bean: xlsUploaderInstance, field: "path")}</g:link></td>
					
						<td>${fieldValue(bean: xlsUploaderInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${xlsUploaderInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
