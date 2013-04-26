
<%@ page import="com.codebee.themes.Footer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'footer.label', default: 'Footer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-footer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-footer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list footer">
			
				<g:if test="${footerInstance?.bgcolor}">
				<li class="fieldcontain">
					<span id="bgcolor-label" class="property-label"><g:message code="footer.bgcolor.label" default="Bgcolor" /></span>
					
						<span class="property-value" aria-labelledby="bgcolor-label"><g:fieldValue bean="${footerInstance}" field="bgcolor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.fb_like}">
				<li class="fieldcontain">
					<span id="fb_like-label" class="property-label"><g:message code="footer.fb_like.label" default="Fblike" /></span>
					
						<span class="property-value" aria-labelledby="fb_like-label"><g:formatBoolean boolean="${footerInstance?.fb_like}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.flicker_share}">
				<li class="fieldcontain">
					<span id="flicker_share-label" class="property-label"><g:message code="footer.flicker_share.label" default="Flickershare" /></span>
					
						<span class="property-value" aria-labelledby="flicker_share-label"><g:formatBoolean boolean="${footerInstance?.flicker_share}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.footer_list}">
				<li class="fieldcontain">
					<span id="footer_list-label" class="property-label"><g:message code="footer.footer_list.label" default="Footerlist" /></span>
					
						<span class="property-value" aria-labelledby="footer_list-label"><g:fieldValue bean="${footerInstance}" field="footer_list"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.google_plusone}">
				<li class="fieldcontain">
					<span id="google_plusone-label" class="property-label"><g:message code="footer.google_plusone.label" default="Googleplusone" /></span>
					
						<span class="property-value" aria-labelledby="google_plusone-label"><g:formatBoolean boolean="${footerInstance?.google_plusone}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.link_color}">
				<li class="fieldcontain">
					<span id="link_color-label" class="property-label"><g:message code="footer.link_color.label" default="Linkcolor" /></span>
					
						<span class="property-value" aria-labelledby="link_color-label"><g:fieldValue bean="${footerInstance}" field="link_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.link_color_hov}">
				<li class="fieldcontain">
					<span id="link_color_hov-label" class="property-label"><g:message code="footer.link_color_hov.label" default="Linkcolorhov" /></span>
					
						<span class="property-value" aria-labelledby="link_color_hov-label"><g:fieldValue bean="${footerInstance}" field="link_color_hov"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.social_icon_color}">
				<li class="fieldcontain">
					<span id="social_icon_color-label" class="property-label"><g:message code="footer.social_icon_color.label" default="Socialiconcolor" /></span>
					
						<span class="property-value" aria-labelledby="social_icon_color-label"><g:fieldValue bean="${footerInstance}" field="social_icon_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.textcolor}">
				<li class="fieldcontain">
					<span id="textcolor-label" class="property-label"><g:message code="footer.textcolor.label" default="Textcolor" /></span>
					
						<span class="property-value" aria-labelledby="textcolor-label"><g:fieldValue bean="${footerInstance}" field="textcolor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${footerInstance?.twitter_share}">
				<li class="fieldcontain">
					<span id="twitter_share-label" class="property-label"><g:message code="footer.twitter_share.label" default="Twittershare" /></span>
					
						<span class="property-value" aria-labelledby="twitter_share-label"><g:formatBoolean boolean="${footerInstance?.twitter_share}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${footerInstance?.id}" />
					<g:link class="edit" action="edit" id="${footerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
