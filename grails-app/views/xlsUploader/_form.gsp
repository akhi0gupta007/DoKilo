<%@ page import="com.codebee.products.XlsUploader" %>



<div class="fieldcontain ${hasErrors(bean: xlsUploaderInstance, field: 'path', 'error')} ">
	<label for="path">
		<g:message code="xlsUploader.path.label" default="Path" />
		
	</label>
	<g:textField name="path" value="${xlsUploaderInstance?.path}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: xlsUploaderInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="xlsUploader.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${xlsUploaderInstance?.title}"/>
</div>

