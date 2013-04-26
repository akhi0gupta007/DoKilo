
<%@ page import="com.codebee.themes.Gen_content" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gen_content.label', default: 'Gen_content')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gen_content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gen_content" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="bgcolor_color" title="${message(code: 'gen_content.bgcolor_color.label', default: 'Bgcolorcolor')}" />
					
						<g:sortableColumn property="headers_color" title="${message(code: 'gen_content.headers_color.label', default: 'Headerscolor')}" />
					
						<g:sortableColumn property="links_Hover_color" title="${message(code: 'gen_content.links_Hover_color.label', default: 'Links Hovercolor')}" />
					
						<g:sortableColumn property="links_color" title="${message(code: 'gen_content.links_color.label', default: 'Linkscolor')}" />
					
						<g:sortableColumn property="sec_color" title="${message(code: 'gen_content.sec_color.label', default: 'Seccolor')}" />
					
						<g:sortableColumn property="table_header_color" title="${message(code: 'gen_content.table_header_color.label', default: 'Tableheadercolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gen_contentInstanceList}" status="i" var="gen_contentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gen_contentInstance.id}">${fieldValue(bean: gen_contentInstance, field: "bgcolor_color")}</g:link></td>
					
						<td>${fieldValue(bean: gen_contentInstance, field: "headers_color")}</td>
					
						<td>${fieldValue(bean: gen_contentInstance, field: "links_Hover_color")}</td>
					
						<td>${fieldValue(bean: gen_contentInstance, field: "links_color")}</td>
					
						<td>${fieldValue(bean: gen_contentInstance, field: "sec_color")}</td>
					
						<td>${fieldValue(bean: gen_contentInstance, field: "table_header_color")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gen_contentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
