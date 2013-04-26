<%@ page import="com.codebee.themes.Right_look" %>



<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'div_color_hov', 'error')} ">
	<label for="div_color_hov">
		<g:message code="right_look.div_color_hov.label" default="Divcolorhov" />
		
	</label>
	<g:textField name="div_color_hov" value="${right_lookInstance?.div_color_hov}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'link_color', 'error')} ">
	<label for="link_color">
		<g:message code="right_look.link_color.label" default="Linkcolor" />
		
	</label>
	<g:textField name="link_color" value="${right_lookInstance?.link_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'link_color_hov', 'error')} ">
	<label for="link_color_hov">
		<g:message code="right_look.link_color_hov.label" default="Linkcolorhov" />
		
	</label>
	<g:textField name="link_color_hov" value="${right_lookInstance?.link_color_hov}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'show_right', 'error')} ">
	<label for="show_right">
		<g:message code="right_look.show_right.label" default="Showright" />
		
	</label>
	<g:checkBox name="show_right" value="${right_lookInstance?.show_right}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'text_color', 'error')} ">
	<label for="text_color">
		<g:message code="right_look.text_color.label" default="Textcolor" />
		
	</label>
	<g:textField name="text_color" value="${right_lookInstance?.text_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'widget_bgcolor', 'error')} ">
	<label for="widget_bgcolor">
		<g:message code="right_look.widget_bgcolor.label" default="Widgetbgcolor" />
		
	</label>
	<g:textField name="widget_bgcolor" value="${right_lookInstance?.widget_bgcolor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'widget_font', 'error')} ">
	<label for="widget_font">
		<g:message code="right_look.widget_font.label" default="Widgetfont" />
		
	</label>
	<g:textField name="widget_font" value="${right_lookInstance?.widget_font}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'widget_size', 'error')} ">
	<label for="widget_size">
		<g:message code="right_look.widget_size.label" default="Widgetsize" />
		
	</label>
	<g:field type="number" name="widget_size" value="${fieldValue(bean: right_lookInstance, field: 'widget_size')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_lookInstance, field: 'widget_title_color', 'error')} ">
	<label for="widget_title_color">
		<g:message code="right_look.widget_title_color.label" default="Widgettitlecolor" />
		
	</label>
	<g:textField name="widget_title_color" value="${right_lookInstance?.widget_title_color}" />
</div>

