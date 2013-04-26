<%@ page import="com.codebee.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="profile.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${profileInstance?.address}" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="profile.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${profileInstance?.country}" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'expertise', 'error')} ">
	<label for="expertise">
		<g:message code="profile.expertise.label" default="Expertise" />
		
	</label>
	<g:textField name="expertise" value="${profileInstance?.expertise}" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'fullName', 'error')} ">
	<label for="fullName">
		<g:message code="profile.fullName.label" default="Full Name" />
		
	</label>
	<g:textField name="fullName" value="${profileInstance?.fullName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'mobile', 'error')} ">
	<label for="mobile">
		<g:message code="profile.mobile.label" default="Mobile" />
		
	</label>
	<g:textField name="mobile" value="${profileInstance?.mobile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="profile.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${profileInstance?.phone}" />
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'purpose', 'error')} ">
	<label for="purpose">
		<g:message code="profile.purpose.label" default="Purpose" />
		
	</label>
	<g:textField name="purpose" value="${profileInstance?.purpose}" />
</div>

