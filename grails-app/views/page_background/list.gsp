
<%@ page import="com.codebee.themes.Page_background" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'page_background.label', default: 'Page_background')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-page_background" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-page_background" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="align" title="${message(code: 'page_background.align.label', default: 'Align')}" />
					
						<g:sortableColumn property="bgcolor" title="${message(code: 'page_background.bgcolor.label', default: 'Bgcolor')}" />
					
						<g:sortableColumn property="upload" title="${message(code: 'page_background.upload.label', default: 'Upload')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${page_backgroundInstanceList}" status="i" var="page_backgroundInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${page_backgroundInstance.id}">${fieldValue(bean: page_backgroundInstance, field: "align")}</g:link></td>
					
						<td>${fieldValue(bean: page_backgroundInstance, field: "bgcolor")}</td>
					
						<td>${fieldValue(bean: page_backgroundInstance, field: "upload")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${page_backgroundInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
