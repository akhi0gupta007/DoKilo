
<%@ page import="com.codebee.logistics.Shipping" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shipping.label', default: 'Shipping')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-shipping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-shipping" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shipping">
			
				<g:if test="${shippingInstance?.plan}">
				<li class="fieldcontain">
					<span id="plan-label" class="property-label"><g:message code="shipping.plan.label" default="Plan" /></span>
					
						<span class="property-value" aria-labelledby="plan-label"><g:fieldValue bean="${shippingInstance}" field="plan"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingInstance?.lo_price}">
				<li class="fieldcontain">
					<span id="lo_price-label" class="property-label"><g:message code="shipping.lo_price.label" default="Loprice" /></span>
					
						<span class="property-value" aria-labelledby="lo_price-label"><g:fieldValue bean="${shippingInstance}" field="lo_price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingInstance?.lo_wt}">
				<li class="fieldcontain">
					<span id="lo_wt-label" class="property-label"><g:message code="shipping.lo_wt.label" default="Lowt" /></span>
					
						<span class="property-value" aria-labelledby="lo_wt-label"><g:fieldValue bean="${shippingInstance}" field="lo_wt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingInstance?.up_price}">
				<li class="fieldcontain">
					<span id="up_price-label" class="property-label"><g:message code="shipping.up_price.label" default="Upprice" /></span>
					
						<span class="property-value" aria-labelledby="up_price-label"><g:fieldValue bean="${shippingInstance}" field="up_price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingInstance?.up_wt}">
				<li class="fieldcontain">
					<span id="up_wt-label" class="property-label"><g:message code="shipping.up_wt.label" default="Upwt" /></span>
					
						<span class="property-value" aria-labelledby="up_wt-label"><g:fieldValue bean="${shippingInstance}" field="up_wt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${shippingInstance?.wt_based}">
				<li class="fieldcontain">
					<span id="wt_based-label" class="property-label"><g:message code="shipping.wt_based.label" default="Wtbased" /></span>
					
						<span class="property-value" aria-labelledby="wt_based-label"><g:formatBoolean boolean="${shippingInstance?.wt_based}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${shippingInstance?.id}" />
					<g:link class="edit" action="edit" id="${shippingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
