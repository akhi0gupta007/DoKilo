<%@ page import="com.codebee.themes.Header_search" %>



<div class="fieldcontain ${hasErrors(bean: header_searchInstance, field: 'box_border_color', 'error')} ">
	<label for="box_border_color">
		<g:message code="header_search.box_border_color.label" default="Boxbordercolor" />
		
	</label>
	<g:textField name="box_border_color" value="${header_searchInstance?.box_border_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_searchInstance, field: 'icon_color', 'error')} ">
	<label for="icon_color">
		<g:message code="header_search.icon_color.label" default="Iconcolor" />
		
	</label>
	<g:textField name="icon_color" value="${header_searchInstance?.icon_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_searchInstance, field: 'show_search', 'error')} ">
	<label for="show_search">
		<g:message code="header_search.show_search.label" default="Showsearch" />
		
	</label>
	<g:checkBox name="show_search" value="${header_searchInstance?.show_search}" />
</div>

