<%@ page import="com.codebee.sales.Sales" %>



<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="sales.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.codebee.User.list()}" optionKey="id" required="" value="${salesInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesInstance, field: 'temp', 'error')} required">
	<label for="temp">
		<g:message code="sales.temp.label" default="Temp" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="temp" name="temp.id" from="${com.codebee.themes.Templates.list()}" optionKey="id" required="" value="${salesInstance?.temp?.id}" class="many-to-one"/>
</div>

