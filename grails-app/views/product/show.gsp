
<%@ page import="com.codebee.products.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.sel_price}">
				<li class="fieldcontain">
					<span id="sel_price-label" class="property-label"><g:message code="product.sel_price.label" default="Selprice" /></span>
					
						<span class="property-value" aria-labelledby="sel_price-label"><g:fieldValue bean="${productInstance}" field="sel_price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.list_price}">
				<li class="fieldcontain">
					<span id="list_price-label" class="property-label"><g:message code="product.list_price.label" default="Listprice" /></span>
					
						<span class="property-value" aria-labelledby="list_price-label"><g:fieldValue bean="${productInstance}" field="list_price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="product.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${productInstance}" field="image"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="product.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${productInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.vendor}">
				<li class="fieldcontain">
					<span id="vendor-label" class="property-label"><g:message code="product.vendor.label" default="Vendor" /></span>
					
						<span class="property-value" aria-labelledby="vendor-label"><g:link controller="vendor" action="show" id="${productInstance?.vendor?.id}">${productInstance?.vendor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="product.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="proType" action="show" id="${productInstance?.type?.id}">${productInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="product.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${productInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.dimen}">
				<li class="fieldcontain">
					<span id="dimen-label" class="property-label"><g:message code="product.dimen.label" default="Dimen" /></span>
					
						<span class="property-value" aria-labelledby="dimen-label"><g:fieldValue bean="${productInstance}" field="dimen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.pkg_dimen}">
				<li class="fieldcontain">
					<span id="pkg_dimen-label" class="property-label"><g:message code="product.pkg_dimen.label" default="Pkgdimen" /></span>
					
						<span class="property-value" aria-labelledby="pkg_dimen-label"><g:fieldValue bean="${productInstance}" field="pkg_dimen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.pro_id}">
				<li class="fieldcontain">
					<span id="pro_id-label" class="property-label"><g:message code="product.pro_id.label" default="Proid" /></span>
					
						<span class="property-value" aria-labelledby="pro_id-label"><g:fieldValue bean="${productInstance}" field="pro_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.quan}">
				<li class="fieldcontain">
					<span id="quan-label" class="property-label"><g:message code="product.quan.label" default="Quan" /></span>
					
						<span class="property-value" aria-labelledby="quan-label"><g:fieldValue bean="${productInstance}" field="quan"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.avail}">
				<li class="fieldcontain">
					<span id="avail-label" class="property-label"><g:message code="product.avail.label" default="Avail" /></span>
					
						<span class="property-value" aria-labelledby="avail-label"><g:formatDate date="${productInstance?.avail}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.variants}">
				<li class="fieldcontain">
					<span id="variants-label" class="property-label"><g:message code="product.variants.label" default="Variants" /></span>
					
						<span class="property-value" aria-labelledby="variants-label"><g:link controller="variants" action="show" id="${productInstance?.variants?.id}">${productInstance?.variants?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.collection}">
				<li class="fieldcontain">
					<span id="collection-label" class="property-label"><g:message code="product.collection.label" default="Collection" /></span>
					
						<g:each in="${productInstance.collection}" var="c">
						<span class="property-value" aria-labelledby="collection-label"><g:link controller="customCollection" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.ofo}">
				<li class="fieldcontain">
					<span id="ofo-label" class="property-label"><g:message code="product.ofo.label" default="Ofo" /></span>
					
						<span class="property-value" aria-labelledby="ofo-label"><g:formatBoolean boolean="${productInstance?.ofo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.ship_addr}">
				<li class="fieldcontain">
					<span id="ship_addr-label" class="property-label"><g:message code="product.ship_addr.label" default="Shipaddr" /></span>
					
						<span class="property-value" aria-labelledby="ship_addr-label"><g:formatBoolean boolean="${productInstance?.ship_addr}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.smart}">
				<li class="fieldcontain">
					<span id="smart-label" class="property-label"><g:message code="product.smart.label" default="Smart" /></span>
					
						<g:each in="${productInstance.smart}" var="s">
						<span class="property-value" aria-labelledby="smart-label"><g:link controller="smartCollection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.tax}">
				<li class="fieldcontain">
					<span id="tax-label" class="property-label"><g:message code="product.tax.label" default="Tax" /></span>
					
						<span class="property-value" aria-labelledby="tax-label"><g:formatBoolean boolean="${productInstance?.tax}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productInstance?.id}" />
					<g:link class="edit" action="edit" id="${productInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
