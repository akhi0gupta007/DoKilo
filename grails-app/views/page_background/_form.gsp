<%@ page import="com.codebee.themes.Page_background" %>



<div class="fieldcontain ${hasErrors(bean: page_backgroundInstance, field: 'align', 'error')} ">
	<label for="align">
		<g:message code="page_background.align.label" default="Align" />
		
	</label>
	<g:textField name="align" value="${page_backgroundInstance?.align}" />
</div>

<div class="fieldcontain ${hasErrors(bean: page_backgroundInstance, field: 'bgcolor', 'error')} ">
	<label for="bgcolor">
		<g:message code="page_background.bgcolor.label" default="Bgcolor" />
		
	</label>
	<g:textField name="bgcolor" value="${page_backgroundInstance?.bgcolor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: page_backgroundInstance, field: 'upload', 'error')} ">
	<label for="upload">
		<g:message code="page_background.upload.label" default="Upload" />
		
	</label>
	<g:textField name="upload" value="${page_backgroundInstance?.upload}" />
</div>

