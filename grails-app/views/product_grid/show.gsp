
<%@ page import="com.codebee.themes.Product_grid" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product_grid.label', default: 'Product_grid')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product_grid" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product_grid" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product_grid">
			
				<g:if test="${product_gridInstance?.bgcolor_behind_name}">
				<li class="fieldcontain">
					<span id="bgcolor_behind_name-label" class="property-label"><g:message code="product_grid.bgcolor_behind_name.label" default="Bgcolorbehindname" /></span>
					
						<span class="property-value" aria-labelledby="bgcolor_behind_name-label"><g:fieldValue bean="${product_gridInstance}" field="bgcolor_behind_name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_gridInstance?.bgcolor_price_color}">
				<li class="fieldcontain">
					<span id="bgcolor_price_color-label" class="property-label"><g:message code="product_grid.bgcolor_price_color.label" default="Bgcolorpricecolor" /></span>
					
						<span class="property-value" aria-labelledby="bgcolor_price_color-label"><g:fieldValue bean="${product_gridInstance}" field="bgcolor_price_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_gridInstance?.header_color}">
				<li class="fieldcontain">
					<span id="header_color-label" class="property-label"><g:message code="product_grid.header_color.label" default="Headercolor" /></span>
					
						<span class="property-value" aria-labelledby="header_color-label"><g:fieldValue bean="${product_gridInstance}" field="header_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_gridInstance?.header_font_size}">
				<li class="fieldcontain">
					<span id="header_font_size-label" class="property-label"><g:message code="product_grid.header_font_size.label" default="Headerfontsize" /></span>
					
						<span class="property-value" aria-labelledby="header_font_size-label"><g:fieldValue bean="${product_gridInstance}" field="header_font_size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_gridInstance?.header_font_style}">
				<li class="fieldcontain">
					<span id="header_font_style-label" class="property-label"><g:message code="product_grid.header_font_style.label" default="Headerfontstyle" /></span>
					
						<span class="property-value" aria-labelledby="header_font_style-label"><g:fieldValue bean="${product_gridInstance}" field="header_font_style"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_gridInstance?.link_color}">
				<li class="fieldcontain">
					<span id="link_color-label" class="property-label"><g:message code="product_grid.link_color.label" default="Linkcolor" /></span>
					
						<span class="property-value" aria-labelledby="link_color-label"><g:fieldValue bean="${product_gridInstance}" field="link_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_gridInstance?.link_color_hov}">
				<li class="fieldcontain">
					<span id="link_color_hov-label" class="property-label"><g:message code="product_grid.link_color_hov.label" default="Linkcolorhov" /></span>
					
						<span class="property-value" aria-labelledby="link_color_hov-label"><g:fieldValue bean="${product_gridInstance}" field="link_color_hov"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_gridInstance?.price_color}">
				<li class="fieldcontain">
					<span id="price_color-label" class="property-label"><g:message code="product_grid.price_color.label" default="Pricecolor" /></span>
					
						<span class="property-value" aria-labelledby="price_color-label"><g:fieldValue bean="${product_gridInstance}" field="price_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_gridInstance?.text_color}">
				<li class="fieldcontain">
					<span id="text_color-label" class="property-label"><g:message code="product_grid.text_color.label" default="Textcolor" /></span>
					
						<span class="property-value" aria-labelledby="text_color-label"><g:fieldValue bean="${product_gridInstance}" field="text_color"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${product_gridInstance?.id}" />
					<g:link class="edit" action="edit" id="${product_gridInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
