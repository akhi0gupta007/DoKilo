
<%@ page import="com.codebee.themes.Home_slides" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'home_slides.label', default: 'Home_slides')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-home_slides" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-home_slides" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="button_arrow_color" title="${message(code: 'home_slides.button_arrow_color.label', default: 'Buttonarrowcolor')}" />
					
						<g:sortableColumn property="button_arrow_color_hov" title="${message(code: 'home_slides.button_arrow_color_hov.label', default: 'Buttonarrowcolorhov')}" />
					
						<g:sortableColumn property="button_color" title="${message(code: 'home_slides.button_color.label', default: 'Buttoncolor')}" />
					
						<g:sortableColumn property="button_color_hov" title="${message(code: 'home_slides.button_color_hov.label', default: 'Buttoncolorhov')}" />
					
						<g:sortableColumn property="show_slide1" title="${message(code: 'home_slides.show_slide1.label', default: 'Showslide1')}" />
					
						<g:sortableColumn property="show_slide2" title="${message(code: 'home_slides.show_slide2.label', default: 'Showslide2')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${home_slidesInstanceList}" status="i" var="home_slidesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${home_slidesInstance.id}">${fieldValue(bean: home_slidesInstance, field: "button_arrow_color")}</g:link></td>
					
						<td>${fieldValue(bean: home_slidesInstance, field: "button_arrow_color_hov")}</td>
					
						<td>${fieldValue(bean: home_slidesInstance, field: "button_color")}</td>
					
						<td>${fieldValue(bean: home_slidesInstance, field: "button_color_hov")}</td>
					
						<td><g:formatBoolean boolean="${home_slidesInstance.show_slide1}" /></td>
					
						<td><g:formatBoolean boolean="${home_slidesInstance.show_slide2}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${home_slidesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
