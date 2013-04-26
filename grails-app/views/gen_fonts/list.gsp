
<%@ page import="com.codebee.themes.Gen_fonts" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gen_fonts.label', default: 'Gen_fonts')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gen_fonts" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gen_fonts" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="body_font" title="${message(code: 'gen_fonts.body_font.label', default: 'Bodyfont')}" />
					
						<g:sortableColumn property="body_font_size" title="${message(code: 'gen_fonts.body_font_size.label', default: 'Bodyfontsize')}" />
					
						<g:sortableColumn property="heading_font" title="${message(code: 'gen_fonts.heading_font.label', default: 'Headingfont')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gen_fontsInstanceList}" status="i" var="gen_fontsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gen_fontsInstance.id}">${fieldValue(bean: gen_fontsInstance, field: "body_font")}</g:link></td>
					
						<td>${fieldValue(bean: gen_fontsInstance, field: "body_font_size")}</td>
					
						<td>${fieldValue(bean: gen_fontsInstance, field: "heading_font")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gen_fontsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
