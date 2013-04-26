
<%@ page import="com.codebee.themes.Product_page" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product_page.label', default: 'Product_page')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product_page" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product_page" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product_page">
			
				<g:if test="${product_pageInstance?.addedtoCart_color}">
				<li class="fieldcontain">
					<span id="addedtoCart_color-label" class="property-label"><g:message code="product_page.addedtoCart_color.label" default="Addedto Cartcolor" /></span>
					
						<span class="property-value" aria-labelledby="addedtoCart_color-label"><g:fieldValue bean="${product_pageInstance}" field="addedtoCart_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.collection}">
				<li class="fieldcontain">
					<span id="collection-label" class="property-label"><g:message code="product_page.collection.label" default="Collection" /></span>
					
						<g:each in="${product_pageInstance.collection}" var="c">
						<span class="property-value" aria-labelledby="collection-label"><g:link controller="customCollection" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.fb_like}">
				<li class="fieldcontain">
					<span id="fb_like-label" class="property-label"><g:message code="product_page.fb_like.label" default="Fblike" /></span>
					
						<span class="property-value" aria-labelledby="fb_like-label"><g:formatBoolean boolean="${product_pageInstance?.fb_like}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.google_plusone}">
				<li class="fieldcontain">
					<span id="google_plusone-label" class="property-label"><g:message code="product_page.google_plusone.label" default="Googleplusone" /></span>
					
						<span class="property-value" aria-labelledby="google_plusone-label"><g:formatBoolean boolean="${product_pageInstance?.google_plusone}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.numof_collection_items}">
				<li class="fieldcontain">
					<span id="numof_collection_items-label" class="property-label"><g:message code="product_page.numof_collection_items.label" default="Numofcollectionitems" /></span>
					
						<span class="property-value" aria-labelledby="numof_collection_items-label"><g:fieldValue bean="${product_pageInstance}" field="numof_collection_items"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.price_color}">
				<li class="fieldcontain">
					<span id="price_color-label" class="property-label"><g:message code="product_page.price_color.label" default="Pricecolor" /></span>
					
						<span class="property-value" aria-labelledby="price_color-label"><g:fieldValue bean="${product_pageInstance}" field="price_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.product_name_font}">
				<li class="fieldcontain">
					<span id="product_name_font-label" class="property-label"><g:message code="product_page.product_name_font.label" default="Productnamefont" /></span>
					
						<span class="property-value" aria-labelledby="product_name_font-label"><g:fieldValue bean="${product_pageInstance}" field="product_name_font"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.product_name_font_size}">
				<li class="fieldcontain">
					<span id="product_name_font_size-label" class="property-label"><g:message code="product_page.product_name_font_size.label" default="Productnamefontsize" /></span>
					
						<span class="property-value" aria-labelledby="product_name_font_size-label"><g:fieldValue bean="${product_pageInstance}" field="product_name_font_size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.show_ven_below}">
				<li class="fieldcontain">
					<span id="show_ven_below-label" class="property-label"><g:message code="product_page.show_ven_below.label" default="Showvenbelow" /></span>
					
						<span class="property-value" aria-labelledby="show_ven_below-label"><g:formatBoolean boolean="${product_pageInstance?.show_ven_below}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${product_pageInstance?.twitter_share}">
				<li class="fieldcontain">
					<span id="twitter_share-label" class="property-label"><g:message code="product_page.twitter_share.label" default="Twittershare" /></span>
					
						<span class="property-value" aria-labelledby="twitter_share-label"><g:formatBoolean boolean="${product_pageInstance?.twitter_share}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${product_pageInstance?.id}" />
					<g:link class="edit" action="edit" id="${product_pageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
