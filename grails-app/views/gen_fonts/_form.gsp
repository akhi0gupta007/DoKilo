<%@ page import="com.codebee.themes.Gen_fonts" %>



<div class="fieldcontain ${hasErrors(bean: gen_fontsInstance, field: 'body_font', 'error')} ">
	<label for="body_font">
		<g:message code="gen_fonts.body_font.label" default="Bodyfont" />
		
	</label>
	<g:textField name="body_font" value="${gen_fontsInstance?.body_font}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_fontsInstance, field: 'body_font_size', 'error')} ">
	<label for="body_font_size">
		<g:message code="gen_fonts.body_font_size.label" default="Bodyfontsize" />
		
	</label>
	<g:field type="number" name="body_font_size" value="${fieldValue(bean: gen_fontsInstance, field: 'body_font_size')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_fontsInstance, field: 'heading_font', 'error')} ">
	<label for="heading_font">
		<g:message code="gen_fonts.heading_font.label" default="Headingfont" />
		
	</label>
	<g:textField name="heading_font" value="${gen_fontsInstance?.heading_font}" />
</div>

