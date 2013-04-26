<%@ page import="com.codebee.products.CustomVariant" %>



<div class="fieldcontain ${hasErrors(bean: customVariantInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="customVariant.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${customVariantInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customVariantInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="customVariant.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${customVariantInstance?.value}"/>
</div>

