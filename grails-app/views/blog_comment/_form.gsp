<%@ page import="com.codebee.themes.Blog_comment" %>



<div class="fieldcontain ${hasErrors(bean: blog_commentInstance, field: 'author_color', 'error')} ">
	<label for="author_color">
		<g:message code="blog_comment.author_color.label" default="Authorcolor" />
		
	</label>
	<g:textField name="author_color" value="${blog_commentInstance?.author_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: blog_commentInstance, field: 'bgcolor', 'error')} ">
	<label for="bgcolor">
		<g:message code="blog_comment.bgcolor.label" default="Bgcolor" />
		
	</label>
	<g:textField name="bgcolor" value="${blog_commentInstance?.bgcolor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: blog_commentInstance, field: 'date_color', 'error')} ">
	<label for="date_color">
		<g:message code="blog_comment.date_color.label" default="Datecolor" />
		
	</label>
	<g:textField name="date_color" value="${blog_commentInstance?.date_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: blog_commentInstance, field: 'textcolor', 'error')} ">
	<label for="textcolor">
		<g:message code="blog_comment.textcolor.label" default="Textcolor" />
		
	</label>
	<g:textField name="textcolor" value="${blog_commentInstance?.textcolor}" />
</div>

