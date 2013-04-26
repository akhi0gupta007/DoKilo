<%@ page import="com.codebee.themes.Right_welcome" %>



<div class="fieldcontain ${hasErrors(bean: right_welcomeInstance, field: 'show_widget', 'error')} ">
	<label for="show_widget">
		<g:message code="right_welcome.show_widget.label" default="Showwidget" />
		
	</label>
	<g:checkBox name="show_widget" value="${right_welcomeInstance?.show_widget}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_welcomeInstance, field: 'wel_desc', 'error')} ">
	<label for="wel_desc">
		<g:message code="right_welcome.wel_desc.label" default="Weldesc" />
		
	</label>
	<g:textField name="wel_desc" value="${right_welcomeInstance?.wel_desc}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_welcomeInstance, field: 'wel_title', 'error')} ">
	<label for="wel_title">
		<g:message code="right_welcome.wel_title.label" default="Weltitle" />
		
	</label>
	<g:textField name="wel_title" value="${right_welcomeInstance?.wel_title}" />
</div>

