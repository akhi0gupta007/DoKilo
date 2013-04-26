
<%@ page import="com.codebee.themes.Footer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'footer.label', default: 'Footer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-footer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-footer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="bgcolor" title="${message(code: 'footer.bgcolor.label', default: 'Bgcolor')}" />
					
						<g:sortableColumn property="fb_like" title="${message(code: 'footer.fb_like.label', default: 'Fblike')}" />
					
						<g:sortableColumn property="flicker_share" title="${message(code: 'footer.flicker_share.label', default: 'Flickershare')}" />
					
						<g:sortableColumn property="footer_list" title="${message(code: 'footer.footer_list.label', default: 'Footerlist')}" />
					
						<g:sortableColumn property="google_plusone" title="${message(code: 'footer.google_plusone.label', default: 'Googleplusone')}" />
					
						<g:sortableColumn property="link_color" title="${message(code: 'footer.link_color.label', default: 'Linkcolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${footerInstanceList}" status="i" var="footerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${footerInstance.id}">${fieldValue(bean: footerInstance, field: "bgcolor")}</g:link></td>
					
						<td><g:formatBoolean boolean="${footerInstance.fb_like}" /></td>
					
						<td><g:formatBoolean boolean="${footerInstance.flicker_share}" /></td>
					
						<td>${fieldValue(bean: footerInstance, field: "footer_list")}</td>
					
						<td><g:formatBoolean boolean="${footerInstance.google_plusone}" /></td>
					
						<td>${fieldValue(bean: footerInstance, field: "link_color")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${footerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
