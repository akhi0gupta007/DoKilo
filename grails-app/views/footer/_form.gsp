<%@ page import="com.codebee.themes.Footer" %>



<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'bgcolor', 'error')} ">
	<label for="bgcolor">
		<g:message code="footer.bgcolor.label" default="Bgcolor" />
		
	</label>
	<g:textField name="bgcolor" value="${footerInstance?.bgcolor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'fb_like', 'error')} ">
	<label for="fb_like">
		<g:message code="footer.fb_like.label" default="Fblike" />
		
	</label>
	<g:checkBox name="fb_like" value="${footerInstance?.fb_like}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'flicker_share', 'error')} ">
	<label for="flicker_share">
		<g:message code="footer.flicker_share.label" default="Flickershare" />
		
	</label>
	<g:checkBox name="flicker_share" value="${footerInstance?.flicker_share}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'footer_list', 'error')} ">
	<label for="footer_list">
		<g:message code="footer.footer_list.label" default="Footerlist" />
		
	</label>
	<g:textField name="footer_list" value="${footerInstance?.footer_list}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'google_plusone', 'error')} ">
	<label for="google_plusone">
		<g:message code="footer.google_plusone.label" default="Googleplusone" />
		
	</label>
	<g:checkBox name="google_plusone" value="${footerInstance?.google_plusone}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'link_color', 'error')} ">
	<label for="link_color">
		<g:message code="footer.link_color.label" default="Linkcolor" />
		
	</label>
	<g:textField name="link_color" value="${footerInstance?.link_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'link_color_hov', 'error')} ">
	<label for="link_color_hov">
		<g:message code="footer.link_color_hov.label" default="Linkcolorhov" />
		
	</label>
	<g:textField name="link_color_hov" value="${footerInstance?.link_color_hov}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'social_icon_color', 'error')} ">
	<label for="social_icon_color">
		<g:message code="footer.social_icon_color.label" default="Socialiconcolor" />
		
	</label>
	<g:textField name="social_icon_color" value="${footerInstance?.social_icon_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'textcolor', 'error')} ">
	<label for="textcolor">
		<g:message code="footer.textcolor.label" default="Textcolor" />
		
	</label>
	<g:textField name="textcolor" value="${footerInstance?.textcolor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: footerInstance, field: 'twitter_share', 'error')} ">
	<label for="twitter_share">
		<g:message code="footer.twitter_share.label" default="Twittershare" />
		
	</label>
	<g:checkBox name="twitter_share" value="${footerInstance?.twitter_share}" />
</div>

