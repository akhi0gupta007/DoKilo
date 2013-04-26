<%@ page import="com.codebee.themes.Header_cart" %>



<div class="fieldcontain ${hasErrors(bean: header_cartInstance, field: 'bgcolor', 'error')} ">
	<label for="bgcolor">
		<g:message code="header_cart.bgcolor.label" default="Bgcolor" />
		
	</label>
	<g:textField name="bgcolor" value="${header_cartInstance?.bgcolor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_cartInstance, field: 'cart_icon', 'error')} ">
	<label for="cart_icon">
		<g:message code="header_cart.cart_icon.label" default="Carticon" />
		
	</label>
	<g:textField name="cart_icon" value="${header_cartInstance?.cart_icon}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_cartInstance, field: 'divider_color', 'error')} ">
	<label for="divider_color">
		<g:message code="header_cart.divider_color.label" default="Dividercolor" />
		
	</label>
	<g:textField name="divider_color" value="${header_cartInstance?.divider_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_cartInstance, field: 'links_Hover_color', 'error')} ">
	<label for="links_Hover_color">
		<g:message code="header_cart.links_Hover_color.label" default="Links Hovercolor" />
		
	</label>
	<g:textField name="links_Hover_color" value="${header_cartInstance?.links_Hover_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: header_cartInstance, field: 'links_color', 'error')} ">
	<label for="links_color">
		<g:message code="header_cart.links_color.label" default="Linkscolor" />
		
	</label>
	<g:textField name="links_color" value="${header_cartInstance?.links_color}" />
</div>

