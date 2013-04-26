<%@ page import="com.codebee.themes.Cart_page" %>



<div class="fieldcontain ${hasErrors(bean: cart_pageInstance, field: 'allow_addnote', 'error')} ">
	<label for="allow_addnote">
		<g:message code="cart_page.allow_addnote.label" default="Allowaddnote" />
		
	</label>
	<g:checkBox name="allow_addnote" value="${cart_pageInstance?.allow_addnote}" />
</div>

