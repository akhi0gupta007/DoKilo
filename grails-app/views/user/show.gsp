
<%@ page import="com.codebee.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.userId}">
				<li class="fieldcontain">
					<span id="userId-label" class="property-label"><g:message code="user.userId.label" default="User Id" /></span>
					
						<span class="property-value" aria-labelledby="userId-label"><g:fieldValue bean="${userInstance}" field="userId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.emailId}">
				<li class="fieldcontain">
					<span id="emailId-label" class="property-label"><g:message code="user.emailId.label" default="Email Id" /></span>
					
						<span class="property-value" aria-labelledby="emailId-label"><g:fieldValue bean="${userInstance}" field="emailId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.profile}">
				<li class="fieldcontain">
					<span id="profile-label" class="property-label"><g:message code="user.profile.label" default="Profile" /></span>
					
						<span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show" id="${userInstance?.profile?.id}">${userInstance?.profile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.collection}">
				<li class="fieldcontain">
					<span id="collection-label" class="property-label"><g:message code="user.collection.label" default="Collection" /></span>
					
						<g:each in="${userInstance.collection}" var="c">
						<span class="property-value" aria-labelledby="collection-label"><g:link controller="customCollection" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="user.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.proType}">
				<li class="fieldcontain">
					<span id="proType-label" class="property-label"><g:message code="user.proType.label" default="Pro Type" /></span>
					
						<g:each in="${userInstance.proType}" var="p">
						<span class="property-value" aria-labelledby="proType-label"><g:link controller="proType" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="user.product.label" default="Product" /></span>
					
						<g:each in="${userInstance.product}" var="p">
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.smartcollection}">
				<li class="fieldcontain">
					<span id="smartcollection-label" class="property-label"><g:message code="user.smartcollection.label" default="Smartcollection" /></span>
					
						<g:each in="${userInstance.smartcollection}" var="s">
						<span class="property-value" aria-labelledby="smartcollection-label"><g:link controller="smartCollection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.templates}">
				<li class="fieldcontain">
					<span id="templates-label" class="property-label"><g:message code="user.templates.label" default="Templates" /></span>
					
						<g:each in="${userInstance.templates}" var="t">
						<span class="property-value" aria-labelledby="templates-label"><g:link controller="templates" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.variants}">
				<li class="fieldcontain">
					<span id="variants-label" class="property-label"><g:message code="user.variants.label" default="Variants" /></span>
					
						<g:each in="${userInstance.variants}" var="v">
						<span class="property-value" aria-labelledby="variants-label"><g:link controller="variants" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.vendor}">
				<li class="fieldcontain">
					<span id="vendor-label" class="property-label"><g:message code="user.vendor.label" default="Vendor" /></span>
					
						<g:each in="${userInstance.vendor}" var="v">
						<span class="property-value" aria-labelledby="vendor-label"><g:link controller="vendor" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.xlsUploader}">
				<li class="fieldcontain">
					<span id="xlsUploader-label" class="property-label"><g:message code="user.xlsUploader.label" default="Xls Uploader" /></span>
					
						<g:each in="${userInstance.xlsUploader}" var="x">
						<span class="property-value" aria-labelledby="xlsUploader-label"><g:link controller="xlsUploader" action="show" id="${x.id}">${x?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
