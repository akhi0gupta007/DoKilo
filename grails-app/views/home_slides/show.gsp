
<%@ page import="com.codebee.themes.Home_slides" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'home_slides.label', default: 'Home_slides')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-home_slides" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-home_slides" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list home_slides">
			
				<g:if test="${home_slidesInstance?.button_arrow_color}">
				<li class="fieldcontain">
					<span id="button_arrow_color-label" class="property-label"><g:message code="home_slides.button_arrow_color.label" default="Buttonarrowcolor" /></span>
					
						<span class="property-value" aria-labelledby="button_arrow_color-label"><g:fieldValue bean="${home_slidesInstance}" field="button_arrow_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.button_arrow_color_hov}">
				<li class="fieldcontain">
					<span id="button_arrow_color_hov-label" class="property-label"><g:message code="home_slides.button_arrow_color_hov.label" default="Buttonarrowcolorhov" /></span>
					
						<span class="property-value" aria-labelledby="button_arrow_color_hov-label"><g:fieldValue bean="${home_slidesInstance}" field="button_arrow_color_hov"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.button_color}">
				<li class="fieldcontain">
					<span id="button_color-label" class="property-label"><g:message code="home_slides.button_color.label" default="Buttoncolor" /></span>
					
						<span class="property-value" aria-labelledby="button_color-label"><g:fieldValue bean="${home_slidesInstance}" field="button_color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.button_color_hov}">
				<li class="fieldcontain">
					<span id="button_color_hov-label" class="property-label"><g:message code="home_slides.button_color_hov.label" default="Buttoncolorhov" /></span>
					
						<span class="property-value" aria-labelledby="button_color_hov-label"><g:fieldValue bean="${home_slidesInstance}" field="button_color_hov"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.show_slide1}">
				<li class="fieldcontain">
					<span id="show_slide1-label" class="property-label"><g:message code="home_slides.show_slide1.label" default="Showslide1" /></span>
					
						<span class="property-value" aria-labelledby="show_slide1-label"><g:formatBoolean boolean="${home_slidesInstance?.show_slide1}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.show_slide2}">
				<li class="fieldcontain">
					<span id="show_slide2-label" class="property-label"><g:message code="home_slides.show_slide2.label" default="Showslide2" /></span>
					
						<span class="property-value" aria-labelledby="show_slide2-label"><g:formatBoolean boolean="${home_slidesInstance?.show_slide2}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.show_slide3}">
				<li class="fieldcontain">
					<span id="show_slide3-label" class="property-label"><g:message code="home_slides.show_slide3.label" default="Showslide3" /></span>
					
						<span class="property-value" aria-labelledby="show_slide3-label"><g:formatBoolean boolean="${home_slidesInstance?.show_slide3}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.show_slide4}">
				<li class="fieldcontain">
					<span id="show_slide4-label" class="property-label"><g:message code="home_slides.show_slide4.label" default="Showslide4" /></span>
					
						<span class="property-value" aria-labelledby="show_slide4-label"><g:formatBoolean boolean="${home_slidesInstance?.show_slide4}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.show_slide5}">
				<li class="fieldcontain">
					<span id="show_slide5-label" class="property-label"><g:message code="home_slides.show_slide5.label" default="Showslide5" /></span>
					
						<span class="property-value" aria-labelledby="show_slide5-label"><g:formatBoolean boolean="${home_slidesInstance?.show_slide5}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.show_slide6}">
				<li class="fieldcontain">
					<span id="show_slide6-label" class="property-label"><g:message code="home_slides.show_slide6.label" default="Showslide6" /></span>
					
						<span class="property-value" aria-labelledby="show_slide6-label"><g:formatBoolean boolean="${home_slidesInstance?.show_slide6}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.show_slides}">
				<li class="fieldcontain">
					<span id="show_slides-label" class="property-label"><g:message code="home_slides.show_slides.label" default="Showslides" /></span>
					
						<span class="property-value" aria-labelledby="show_slides-label"><g:formatBoolean boolean="${home_slidesInstance?.show_slides}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.slide1}">
				<li class="fieldcontain">
					<span id="slide1-label" class="property-label"><g:message code="home_slides.slide1.label" default="Slide1" /></span>
					
						<span class="property-value" aria-labelledby="slide1-label"><g:fieldValue bean="${home_slidesInstance}" field="slide1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.slide2}">
				<li class="fieldcontain">
					<span id="slide2-label" class="property-label"><g:message code="home_slides.slide2.label" default="Slide2" /></span>
					
						<span class="property-value" aria-labelledby="slide2-label"><g:fieldValue bean="${home_slidesInstance}" field="slide2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.slide3}">
				<li class="fieldcontain">
					<span id="slide3-label" class="property-label"><g:message code="home_slides.slide3.label" default="Slide3" /></span>
					
						<span class="property-value" aria-labelledby="slide3-label"><g:fieldValue bean="${home_slidesInstance}" field="slide3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.slide4}">
				<li class="fieldcontain">
					<span id="slide4-label" class="property-label"><g:message code="home_slides.slide4.label" default="Slide4" /></span>
					
						<span class="property-value" aria-labelledby="slide4-label"><g:fieldValue bean="${home_slidesInstance}" field="slide4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.slide5}">
				<li class="fieldcontain">
					<span id="slide5-label" class="property-label"><g:message code="home_slides.slide5.label" default="Slide5" /></span>
					
						<span class="property-value" aria-labelledby="slide5-label"><g:fieldValue bean="${home_slidesInstance}" field="slide5"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.slide6}">
				<li class="fieldcontain">
					<span id="slide6-label" class="property-label"><g:message code="home_slides.slide6.label" default="Slide6" /></span>
					
						<span class="property-value" aria-labelledby="slide6-label"><g:fieldValue bean="${home_slidesInstance}" field="slide6"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${home_slidesInstance?.slide_height}">
				<li class="fieldcontain">
					<span id="slide_height-label" class="property-label"><g:message code="home_slides.slide_height.label" default="Slideheight" /></span>
					
						<span class="property-value" aria-labelledby="slide_height-label"><g:fieldValue bean="${home_slidesInstance}" field="slide_height"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${home_slidesInstance?.id}" />
					<g:link class="edit" action="edit" id="${home_slidesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
