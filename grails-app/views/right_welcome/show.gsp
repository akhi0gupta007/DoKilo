
<%@ page import="com.codebee.themes.Right_welcome" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right_welcome.label', default: 'Right_welcome')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-right_welcome" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-right_welcome" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list right_welcome">
			
				<g:if test="${right_welcomeInstance?.show_widget}">
				<li class="fieldcontain">
					<span id="show_widget-label" class="property-label"><g:message code="right_welcome.show_widget.label" default="Showwidget" /></span>
					
						<span class="property-value" aria-labelledby="show_widget-label"><g:formatBoolean boolean="${right_welcomeInstance?.show_widget}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_welcomeInstance?.wel_desc}">
				<li class="fieldcontain">
					<span id="wel_desc-label" class="property-label"><g:message code="right_welcome.wel_desc.label" default="Weldesc" /></span>
					
						<span class="property-value" aria-labelledby="wel_desc-label"><g:fieldValue bean="${right_welcomeInstance}" field="wel_desc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_welcomeInstance?.wel_title}">
				<li class="fieldcontain">
					<span id="wel_title-label" class="property-label"><g:message code="right_welcome.wel_title.label" default="Weltitle" /></span>
					
						<span class="property-value" aria-labelledby="wel_title-label"><g:fieldValue bean="${right_welcomeInstance}" field="wel_title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${right_welcomeInstance?.id}" />
					<g:link class="edit" action="edit" id="${right_welcomeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
