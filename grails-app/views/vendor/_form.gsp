<%@ page import="com.codebee.products.Vendor" %>



<div class="fieldcontain ${hasErrors(bean: vendorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="vendor.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${vendorInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendorInstance, field: 'ven_name', 'error')} required">
	<label for="ven_name">
		<g:message code="vendor.ven_name.label" default="Venname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ven_name" required="" value="${vendorInstance?.ven_name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendorInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="vendor.website.label" default="Website" />
		
	</label>
	<g:field type="url" name="website" value="${vendorInstance?.website}"/>
</div>

