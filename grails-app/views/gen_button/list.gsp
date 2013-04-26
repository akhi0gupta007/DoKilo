
<%@ page import="com.codebee.themes.Gen_button" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gen_button.label', default: 'Gen_button')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gen_button" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gen_button" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="color" title="${message(code: 'gen_button.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="color_hover" title="${message(code: 'gen_button.color_hover.label', default: 'Colorhover')}" />
					
						<g:sortableColumn property="text_color" title="${message(code: 'gen_button.text_color.label', default: 'Textcolor')}" />
					
						<g:sortableColumn property="text_color_hover" title="${message(code: 'gen_button.text_color_hover.label', default: 'Textcolorhover')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gen_buttonInstanceList}" status="i" var="gen_buttonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gen_buttonInstance.id}">${fieldValue(bean: gen_buttonInstance, field: "color")}</g:link></td>
					
						<td>${fieldValue(bean: gen_buttonInstance, field: "color_hover")}</td>
					
						<td>${fieldValue(bean: gen_buttonInstance, field: "text_color")}</td>
					
						<td>${fieldValue(bean: gen_buttonInstance, field: "text_color_hover")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gen_buttonInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
