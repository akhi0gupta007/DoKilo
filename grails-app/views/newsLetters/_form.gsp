<%@ page import="com.codebee.marketing.NewsLetters" %>



<div class="fieldcontain ${hasErrors(bean: newsLettersInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="newsLetters.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${newsLettersInstance?.name}"/>
</div>

