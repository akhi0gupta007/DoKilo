<%@ page import="com.codebee.themes.Header_nav" %>



<div class="fieldcontain ${hasErrors(bean: header_navInstance, field: 'divider_nav_link', 'error')} ">
	<label for="divider_nav_link">
		<g:message code="header_nav.divider_nav_link.label" default="Dividernavlink" />
		
	</label>
	<g:textField name="divider_nav_link" value="${header_navInstance?.divider_nav_link}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_navInstance, field: 'drop_menu_bgcolor', 'error')} ">
	<label for="drop_menu_bgcolor">
		<g:message code="header_nav.drop_menu_bgcolor.label" default="Dropmenubgcolor" />
		
	</label>
	<g:textField name="drop_menu_bgcolor" value="${header_navInstance?.drop_menu_bgcolor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_navInstance, field: 'font_size', 'error')} ">
	<label for="font_size">
		<g:message code="header_nav.font_size.label" default="Fontsize" />
		
	</label>
	<g:field type="number" name="font_size" value="${fieldValue(bean: header_navInstance, field: 'font_size')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_navInstance, field: 'font_style', 'error')} ">
	<label for="font_style">
		<g:message code="header_nav.font_style.label" default="Fontstyle" />
		
	</label>
	<g:textField name="font_style" value="${header_navInstance?.font_style}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_navInstance, field: 'links_Hover_color', 'error')} ">
	<label for="links_Hover_color">
		<g:message code="header_nav.links_Hover_color.label" default="Links Hovercolor" />
		
	</label>
	<g:textField name="links_Hover_color" value="${header_navInstance?.links_Hover_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_navInstance, field: 'links_color', 'error')} ">
	<label for="links_color">
		<g:message code="header_nav.links_color.label" default="Linkscolor" />
		
	</label>
	<g:textField name="links_color" value="${header_navInstance?.links_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_navInstance, field: 'menu_border_color', 'error')} ">
	<label for="menu_border_color">
		<g:message code="header_nav.menu_border_color.label" default="Menubordercolor" />
		
	</label>
	<g:textField name="menu_border_color" value="${header_navInstance?.menu_border_color}" />
</div>

