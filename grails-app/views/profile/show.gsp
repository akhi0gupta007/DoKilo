
<%@ page import="com.codebee.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profile">
			
				<g:if test="${profileInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="profile.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${profileInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="profile.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${profileInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.expertise}">
				<li class="fieldcontain">
					<span id="expertise-label" class="property-label"><g:message code="profile.expertise.label" default="Expertise" /></span>
					
						<span class="property-value" aria-labelledby="expertise-label"><g:fieldValue bean="${profileInstance}" field="expertise"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.fullName}">
				<li class="fieldcontain">
					<span id="fullName-label" class="property-label"><g:message code="profile.fullName.label" default="Full Name" /></span>
					
						<span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${profileInstance}" field="fullName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.mobile}">
				<li class="fieldcontain">
					<span id="mobile-label" class="property-label"><g:message code="profile.mobile.label" default="Mobile" /></span>
					
						<span class="property-value" aria-labelledby="mobile-label"><g:fieldValue bean="${profileInstance}" field="mobile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="profile.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${profileInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.purpose}">
				<li class="fieldcontain">
					<span id="purpose-label" class="property-label"><g:message code="profile.purpose.label" default="Purpose" /></span>
					
						<span class="property-value" aria-labelledby="purpose-label"><g:fieldValue bean="${profileInstance}" field="purpose"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${profileInstance?.id}" />
					<g:link class="edit" action="edit" id="${profileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
