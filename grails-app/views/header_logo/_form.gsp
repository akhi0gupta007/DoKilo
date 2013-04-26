<%@ page import="com.codebee.themes.Header_logo" %>



<div class="fieldcontain ${hasErrors(bean: header_logoInstance, field: 'custom_logo', 'error')} ">
	<label for="custom_logo">
		<g:message code="header_logo.custom_logo.label" default="Customlogo" />
		
	</label>
	<g:textField name="custom_logo" value="${header_logoInstance?.custom_logo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_logoInstance, field: 'font_size', 'error')} ">
	<label for="font_size">
		<g:message code="header_logo.font_size.label" default="Fontsize" />
		
	</label>
	<g:field type="number" name="font_size" value="${fieldValue(bean: header_logoInstance, field: 'font_size')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_logoInstance, field: 'font_style', 'error')} ">
	<label for="font_style">
		<g:message code="header_logo.font_style.label" default="Fontstyle" />
		
	</label>
	<g:textField name="font_style" value="${header_logoInstance?.font_style}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_logoInstance, field: 'logo_link_color', 'error')} ">
	<label for="logo_link_color">
		<g:message code="header_logo.logo_link_color.label" default="Logolinkcolor" />
		
	</label>
	<g:textField name="logo_link_color" value="${header_logoInstance?.logo_link_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_logoInstance, field: 'logo_link_color_hover', 'error')} ">
	<label for="logo_link_color_hover">
		<g:message code="header_logo.logo_link_color_hover.label" default="Logolinkcolorhover" />
		
	</label>
	<g:textField name="logo_link_color_hover" value="${header_logoInstance?.logo_link_color_hover}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_logoInstance, field: 'text_image_toggle', 'error')} ">
	<label for="text_image_toggle">
		<g:message code="header_logo.text_image_toggle.label" default="Textimagetoggle" />
		
	</label>
	<g:checkBox name="text_image_toggle" value="${header_logoInstance?.text_image_toggle}" />
</div>

