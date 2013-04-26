
<%@ page import="com.codebee.themes.Blog_comment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blog_comment.label', default: 'Blog_comment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blog_comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-blog_comment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blog_comment">
			
				<g:if test="${blog_commentInstance?.author_color}">
				<li class="fieldcontain">
					<span id="author_color-label" class="property-label"><g:message code="blog_comment.author_color.label" default="Authorcolor" /></span>
					
						<span class="property-value" aria-labelledby="author_color-label"><g:fieldValue bean="${blog_commentInstance}" field="author_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blog_commentInstance?.bgcolor}">
				<li class="fieldcontain">
					<span id="bgcolor-label" class="property-label"><g:message code="blog_comment.bgcolor.label" default="Bgcolor" /></span>
					
						<span class="property-value" aria-labelledby="bgcolor-label"><g:fieldValue bean="${blog_commentInstance}" field="bgcolor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blog_commentInstance?.date_color}">
				<li class="fieldcontain">
					<span id="date_color-label" class="property-label"><g:message code="blog_comment.date_color.label" default="Datecolor" /></span>
					
						<span class="property-value" aria-labelledby="date_color-label"><g:fieldValue bean="${blog_commentInstance}" field="date_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blog_commentInstance?.textcolor}">
				<li class="fieldcontain">
					<span id="textcolor-label" class="property-label"><g:message code="blog_comment.textcolor.label" default="Textcolor" /></span>
					
						<span class="property-value" aria-labelledby="textcolor-label"><g:fieldValue bean="${blog_commentInstance}" field="textcolor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${blog_commentInstance?.id}" />
					<g:link class="edit" action="edit" id="${blog_commentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
