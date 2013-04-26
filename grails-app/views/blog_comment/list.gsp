
<%@ page import="com.codebee.themes.Blog_comment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blog_comment.label', default: 'Blog_comment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-blog_comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-blog_comment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="author_color" title="${message(code: 'blog_comment.author_color.label', default: 'Authorcolor')}" />
					
						<g:sortableColumn property="bgcolor" title="${message(code: 'blog_comment.bgcolor.label', default: 'Bgcolor')}" />
					
						<g:sortableColumn property="date_color" title="${message(code: 'blog_comment.date_color.label', default: 'Datecolor')}" />
					
						<g:sortableColumn property="textcolor" title="${message(code: 'blog_comment.textcolor.label', default: 'Textcolor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blog_commentInstanceList}" status="i" var="blog_commentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${blog_commentInstance.id}">${fieldValue(bean: blog_commentInstance, field: "author_color")}</g:link></td>
					
						<td>${fieldValue(bean: blog_commentInstance, field: "bgcolor")}</td>
					
						<td>${fieldValue(bean: blog_commentInstance, field: "date_color")}</td>
					
						<td>${fieldValue(bean: blog_commentInstance, field: "textcolor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${blog_commentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
