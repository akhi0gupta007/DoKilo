<%@ page import="com.codebee.themes.Gen_content" %>



<div class="fieldcontain ${hasErrors(bean: gen_contentInstance, field: 'bgcolor_color', 'error')} ">
	<label for="bgcolor_color">
		<g:message code="gen_content.bgcolor_color.label" default="Bgcolorcolor" />
		
	</label>
	<g:textField name="bgcolor_color" value="${gen_contentInstance?.bgcolor_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_contentInstance, field: 'headers_color', 'error')} ">
	<label for="headers_color">
		<g:message code="gen_content.headers_color.label" default="Headerscolor" />
		
	</label>
	<g:textField name="headers_color" value="${gen_contentInstance?.headers_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_contentInstance, field: 'links_Hover_color', 'error')} ">
	<label for="links_Hover_color">
		<g:message code="gen_content.links_Hover_color.label" default="Links Hovercolor" />
		
	</label>
	<g:textField name="links_Hover_color" value="${gen_contentInstance?.links_Hover_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_contentInstance, field: 'links_color', 'error')} ">
	<label for="links_color">
		<g:message code="gen_content.links_color.label" default="Linkscolor" />
		
	</label>
	<g:textField name="links_color" value="${gen_contentInstance?.links_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_contentInstance, field: 'sec_color', 'error')} ">
	<label for="sec_color">
		<g:message code="gen_content.sec_color.label" default="Seccolor" />
		
	</label>
	<g:textField name="sec_color" value="${gen_contentInstance?.sec_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_contentInstance, field: 'table_header_color', 'error')} ">
	<label for="table_header_color">
		<g:message code="gen_content.table_header_color.label" default="Tableheadercolor" />
		
	</label>
	<g:textField name="table_header_color" value="${gen_contentInstance?.table_header_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: gen_contentInstance, field: 'text_color', 'error')} ">
	<label for="text_color">
		<g:message code="gen_content.text_color.label" default="Textcolor" />
		
	</label>
	<g:textField name="text_color" value="${gen_contentInstance?.text_color}" />
</div>

