<%@ page import="com.codebee.themes.Home_slides" %>



<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'button_arrow_color', 'error')} ">
	<label for="button_arrow_color">
		<g:message code="home_slides.button_arrow_color.label" default="Buttonarrowcolor" />
		
	</label>
	<g:textField name="button_arrow_color" value="${home_slidesInstance?.button_arrow_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'button_arrow_color_hov', 'error')} ">
	<label for="button_arrow_color_hov">
		<g:message code="home_slides.button_arrow_color_hov.label" default="Buttonarrowcolorhov" />
		
	</label>
	<g:textField name="button_arrow_color_hov" value="${home_slidesInstance?.button_arrow_color_hov}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'button_color', 'error')} ">
	<label for="button_color">
		<g:message code="home_slides.button_color.label" default="Buttoncolor" />
		
	</label>
	<g:textField name="button_color" value="${home_slidesInstance?.button_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'button_color_hov', 'error')} ">
	<label for="button_color_hov">
		<g:message code="home_slides.button_color_hov.label" default="Buttoncolorhov" />
		
	</label>
	<g:textField name="button_color_hov" value="${home_slidesInstance?.button_color_hov}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'show_slide1', 'error')} ">
	<label for="show_slide1">
		<g:message code="home_slides.show_slide1.label" default="Showslide1" />
		
	</label>
	<g:checkBox name="show_slide1" value="${home_slidesInstance?.show_slide1}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'show_slide2', 'error')} ">
	<label for="show_slide2">
		<g:message code="home_slides.show_slide2.label" default="Showslide2" />
		
	</label>
	<g:checkBox name="show_slide2" value="${home_slidesInstance?.show_slide2}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'show_slide3', 'error')} ">
	<label for="show_slide3">
		<g:message code="home_slides.show_slide3.label" default="Showslide3" />
		
	</label>
	<g:checkBox name="show_slide3" value="${home_slidesInstance?.show_slide3}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'show_slide4', 'error')} ">
	<label for="show_slide4">
		<g:message code="home_slides.show_slide4.label" default="Showslide4" />
		
	</label>
	<g:checkBox name="show_slide4" value="${home_slidesInstance?.show_slide4}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'show_slide5', 'error')} ">
	<label for="show_slide5">
		<g:message code="home_slides.show_slide5.label" default="Showslide5" />
		
	</label>
	<g:checkBox name="show_slide5" value="${home_slidesInstance?.show_slide5}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'show_slide6', 'error')} ">
	<label for="show_slide6">
		<g:message code="home_slides.show_slide6.label" default="Showslide6" />
		
	</label>
	<g:checkBox name="show_slide6" value="${home_slidesInstance?.show_slide6}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'show_slides', 'error')} ">
	<label for="show_slides">
		<g:message code="home_slides.show_slides.label" default="Showslides" />
		
	</label>
	<g:checkBox name="show_slides" value="${home_slidesInstance?.show_slides}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'slide1', 'error')} ">
	<label for="slide1">
		<g:message code="home_slides.slide1.label" default="Slide1" />
		
	</label>
	<g:textField name="slide1" value="${home_slidesInstance?.slide1}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'slide2', 'error')} ">
	<label for="slide2">
		<g:message code="home_slides.slide2.label" default="Slide2" />
		
	</label>
	<g:textField name="slide2" value="${home_slidesInstance?.slide2}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'slide3', 'error')} ">
	<label for="slide3">
		<g:message code="home_slides.slide3.label" default="Slide3" />
		
	</label>
	<g:textField name="slide3" value="${home_slidesInstance?.slide3}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'slide4', 'error')} ">
	<label for="slide4">
		<g:message code="home_slides.slide4.label" default="Slide4" />
		
	</label>
	<g:textField name="slide4" value="${home_slidesInstance?.slide4}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'slide5', 'error')} ">
	<label for="slide5">
		<g:message code="home_slides.slide5.label" default="Slide5" />
		
	</label>
	<g:textField name="slide5" value="${home_slidesInstance?.slide5}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'slide6', 'error')} ">
	<label for="slide6">
		<g:message code="home_slides.slide6.label" default="Slide6" />
		
	</label>
	<g:textField name="slide6" value="${home_slidesInstance?.slide6}" />
</div>

<div class="fieldcontain ${hasErrors(bean: home_slidesInstance, field: 'slide_height', 'error')} ">
	<label for="slide_height">
		<g:message code="home_slides.slide_height.label" default="Slideheight" />
		
	</label>
	<g:field type="number" name="slide_height" value="${fieldValue(bean: home_slidesInstance, field: 'slide_height')}" />
</div>

