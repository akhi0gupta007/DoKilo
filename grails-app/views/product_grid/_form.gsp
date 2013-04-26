<%@ page import="com.codebee.themes.Product_grid" %>



<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'bgcolor_behind_name', 'error')} ">
	<label for="bgcolor_behind_name">
		<g:message code="product_grid.bgcolor_behind_name.label" default="Bgcolorbehindname" />
		
	</label>
	<g:textField name="bgcolor_behind_name" value="${product_gridInstance?.bgcolor_behind_name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'bgcolor_price_color', 'error')} ">
	<label for="bgcolor_price_color">
		<g:message code="product_grid.bgcolor_price_color.label" default="Bgcolorpricecolor" />
		
	</label>
	<g:textField name="bgcolor_price_color" value="${product_gridInstance?.bgcolor_price_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'header_color', 'error')} ">
	<label for="header_color">
		<g:message code="product_grid.header_color.label" default="Headercolor" />
		
	</label>
	<g:textField name="header_color" value="${product_gridInstance?.header_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'header_font_size', 'error')} ">
	<label for="header_font_size">
		<g:message code="product_grid.header_font_size.label" default="Headerfontsize" />
		
	</label>
	<g:field type="number" name="header_font_size" value="${fieldValue(bean: product_gridInstance, field: 'header_font_size')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'header_font_style', 'error')} ">
	<label for="header_font_style">
		<g:message code="product_grid.header_font_style.label" default="Headerfontstyle" />
		
	</label>
	<g:textField name="header_font_style" value="${product_gridInstance?.header_font_style}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'link_color', 'error')} ">
	<label for="link_color">
		<g:message code="product_grid.link_color.label" default="Linkcolor" />
		
	</label>
	<g:textField name="link_color" value="${product_gridInstance?.link_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'link_color_hov', 'error')} ">
	<label for="link_color_hov">
		<g:message code="product_grid.link_color_hov.label" default="Linkcolorhov" />
		
	</label>
	<g:textField name="link_color_hov" value="${product_gridInstance?.link_color_hov}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'price_color', 'error')} ">
	<label for="price_color">
		<g:message code="product_grid.price_color.label" default="Pricecolor" />
		
	</label>
	<g:textField name="price_color" value="${product_gridInstance?.price_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_gridInstance, field: 'text_color', 'error')} ">
	<label for="text_color">
		<g:message code="product_grid.text_color.label" default="Textcolor" />
		
	</label>
	<g:textField name="text_color" value="${product_gridInstance?.text_color}" />
</div>

