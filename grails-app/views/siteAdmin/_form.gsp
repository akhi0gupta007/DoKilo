<%@ page import="com.codebee.SiteAdmin" %>



<div class="fieldcontain ${hasErrors(bean: siteAdminInstance, field: 'userId', 'error')} required">
	<label for="userId">
		<g:message code="siteAdmin.userId.label" default="User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userId" maxlength="15" required="" value="${siteAdminInstance?.userId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteAdminInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="siteAdmin.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="8" required="" value="${siteAdminInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteAdminInstance, field: 'emailId', 'error')} required">
	<label for="emailId">
		<g:message code="siteAdmin.emailId.label" default="Email Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="emailId" required="" value="${siteAdminInstance?.emailId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteAdminInstance, field: 'templates', 'error')} ">
	<label for="templates">
		<g:message code="siteAdmin.templates.label" default="Templates" />
		
	</label>
	<g:select name="templates" from="${com.codebee.themes.Templates.list()}" multiple="multiple" optionKey="id" size="5" value="${siteAdminInstance?.templates*.id}" class="many-to-many"/>
</div>

