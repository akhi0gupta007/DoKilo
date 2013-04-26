
<%@ page import="com.codebee.themes.Right_look" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right_look.label', default: 'Right_look')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-right_look" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-right_look" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list right_look">
			
				<g:if test="${right_lookInstance?.div_color_hov}">
				<li class="fieldcontain">
					<span id="div_color_hov-label" class="property-label"><g:message code="right_look.div_color_hov.label" default="Divcolorhov" /></span>
					
						<span class="property-value" aria-labelledby="div_color_hov-label"><g:fieldValue bean="${right_lookInstance}" field="div_color_hov"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_lookInstance?.link_color}">
				<li class="fieldcontain">
					<span id="link_color-label" class="property-label"><g:message code="right_look.link_color.label" default="Linkcolor" /></span>
					
						<span class="property-value" aria-labelledby="link_color-label"><g:fieldValue bean="${right_lookInstance}" field="link_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_lookInstance?.link_color_hov}">
				<li class="fieldcontain">
					<span id="link_color_hov-label" class="property-label"><g:message code="right_look.link_color_hov.label" default="Linkcolorhov" /></span>
					
						<span class="property-value" aria-labelledby="link_color_hov-label"><g:fieldValue bean="${right_lookInstance}" field="link_color_hov"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_lookInstance?.show_right}">
				<li class="fieldcontain">
					<span id="show_right-label" class="property-label"><g:message code="right_look.show_right.label" default="Showright" /></span>
					
						<span class="property-value" aria-labelledby="show_right-label"><g:formatBoolean boolean="${right_lookInstance?.show_right}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_lookInstance?.text_color}">
				<li class="fieldcontain">
					<span id="text_color-label" class="property-label"><g:message code="right_look.text_color.label" default="Textcolor" /></span>
					
						<span class="property-value" aria-labelledby="text_color-label"><g:fieldValue bean="${right_lookInstance}" field="text_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_lookInstance?.widget_bgcolor}">
				<li class="fieldcontain">
					<span id="widget_bgcolor-label" class="property-label"><g:message code="right_look.widget_bgcolor.label" default="Widgetbgcolor" /></span>
					
						<span class="property-value" aria-labelledby="widget_bgcolor-label"><g:fieldValue bean="${right_lookInstance}" field="widget_bgcolor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_lookInstance?.widget_font}">
				<li class="fieldcontain">
					<span id="widget_font-label" class="property-label"><g:message code="right_look.widget_font.label" default="Widgetfont" /></span>
					
						<span class="property-value" aria-labelledby="widget_font-label"><g:fieldValue bean="${right_lookInstance}" field="widget_font"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_lookInstance?.widget_size}">
				<li class="fieldcontain">
					<span id="widget_size-label" class="property-label"><g:message code="right_look.widget_size.label" default="Widgetsize" /></span>
					
						<span class="property-value" aria-labelledby="widget_size-label"><g:fieldValue bean="${right_lookInstance}" field="widget_size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_lookInstance?.widget_title_color}">
				<li class="fieldcontain">
					<span id="widget_title_color-label" class="property-label"><g:message code="right_look.widget_title_color.label" default="Widgettitlecolor" /></span>
					
						<span class="property-value" aria-labelledby="widget_title_color-label"><g:fieldValue bean="${right_lookInstance}" field="widget_title_color"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${right_lookInstance?.id}" />
					<g:link class="edit" action="edit" id="${right_lookInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
