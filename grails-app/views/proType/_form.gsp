<%@ page import="com.codebee.products.ProType" %>



<div class="fieldcontain ${hasErrors(bean: proTypeInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="proType.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${proTypeInstance?.type}"/>
</div>

