<%@ page import="com.codebee.themes.Gen_button" %>



<div class="fieldcontain ${hasErrors(bean: gen_buttonInstance, field: 'color', 'error')} ">
	<label for="color">
		<g:message code="gen_button.color.label" default="Color" />
		
	</label>
	<g:textField name="color" value="${gen_buttonInstance?.color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_buttonInstance, field: 'color_hover', 'error')} ">
	<label for="color_hover">
		<g:message code="gen_button.color_hover.label" default="Colorhover" />
		
	</label>
	<g:textField name="color_hover" value="${gen_buttonInstance?.color_hover}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_buttonInstance, field: 'text_color', 'error')} ">
	<label for="text_color">
		<g:message code="gen_button.text_color.label" default="Textcolor" />
		
	</label>
	<g:textField name="text_color" value="${gen_buttonInstance?.text_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_buttonInstance, field: 'text_color_hover', 'error')} ">
	<label for="text_color_hover">
		<g:message code="gen_button.text_color_hover.label" default="Textcolorhover" />
		
	</label>
	<g:textField name="text_color_hover" value="${gen_buttonInstance?.text_color_hover}" />
</div>

