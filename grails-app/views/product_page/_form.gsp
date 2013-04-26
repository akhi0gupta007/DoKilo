<%@ page import="com.codebee.themes.Product_page" %>



<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'addedtoCart_color', 'error')} ">
	<label for="addedtoCart_color">
		<g:message code="product_page.addedtoCart_color.label" default="Addedto Cartcolor" />
		
	</label>
	<g:textField name="addedtoCart_color" value="${product_pageInstance?.addedtoCart_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'collection', 'error')} ">
	<label for="collection">
		<g:message code="product_page.collection.label" default="Collection" />
		
	</label>
	<g:select name="collection" from="${com.codebee.products.CustomCollection.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${product_pageInstance?.collection*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'fb_like', 'error')} ">
	<label for="fb_like">
		<g:message code="product_page.fb_like.label" default="Fblike" />
		
	</label>
	<g:checkBox name="fb_like" value="${product_pageInstance?.fb_like}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'google_plusone', 'error')} ">
	<label for="google_plusone">
		<g:message code="product_page.google_plusone.label" default="Googleplusone" />
		
	</label>
	<g:checkBox name="google_plusone" value="${product_pageInstance?.google_plusone}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'numof_collection_items', 'error')} ">
	<label for="numof_collection_items">
		<g:message code="product_page.numof_collection_items.label" default="Numofcollectionitems" />
		
	</label>
	<g:field type="number" name="numof_collection_items" value="${fieldValue(bean: product_pageInstance, field: 'numof_collection_items')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'price_color', 'error')} ">
	<label for="price_color">
		<g:message code="product_page.price_color.label" default="Pricecolor" />
		
	</label>
	<g:textField name="price_color" value="${product_pageInstance?.price_color}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'product_name_font', 'error')} ">
	<label for="product_name_font">
		<g:message code="product_page.product_name_font.label" default="Productnamefont" />
		
	</label>
	<g:textField name="product_name_font" value="${product_pageInstance?.product_name_font}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'product_name_font_size', 'error')} ">
	<label for="product_name_font_size">
		<g:message code="product_page.product_name_font_size.label" default="Productnamefontsize" />
		
	</label>
	<g:field type="number" name="product_name_font_size" value="${fieldValue(bean: product_pageInstance, field: 'product_name_font_size')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'show_ven_below', 'error')} ">
	<label for="show_ven_below">
		<g:message code="product_page.show_ven_below.label" default="Showvenbelow" />
		
	</label>
	<g:checkBox name="show_ven_below" value="${product_pageInstance?.show_ven_below}" />
</div>

<div class="fieldcontain ${hasErrors(bean: product_pageInstance, field: 'twitter_share', 'error')} ">
	<label for="twitter_share">
		<g:message code="product_page.twitter_share.label" default="Twittershare" />
		
	</label>
	<g:checkBox name="twitter_share" value="${product_pageInstance?.twitter_share}" />
</div>

