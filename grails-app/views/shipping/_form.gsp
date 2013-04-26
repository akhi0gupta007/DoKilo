<%@ page import="com.codebee.logistics.Shipping" %>



<div class="fieldcontain ${hasErrors(bean: shippingInstance, field: 'plan', 'error')} required">
	<label for="plan">
		<g:message code="shipping.plan.label" default="Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="plan" required="" value="${shippingInstance?.plan}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shippingInstance, field: 'lo_price', 'error')} required">
	<label for="lo_price">
		<g:message code="shipping.lo_price.label" default="Loprice" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="lo_price" required="" value="${fieldValue(bean: shippingInstance, field: 'lo_price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shippingInstance, field: 'lo_wt', 'error')} required">
	<label for="lo_wt">
		<g:message code="shipping.lo_wt.label" default="Lowt" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="lo_wt" required="" value="${fieldValue(bean: shippingInstance, field: 'lo_wt')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shippingInstance, field: 'up_price', 'error')} required">
	<label for="up_price">
		<g:message code="shipping.up_price.label" default="Upprice" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="up_price" required="" value="${fieldValue(bean: shippingInstance, field: 'up_price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shippingInstance, field: 'up_wt', 'error')} required">
	<label for="up_wt">
		<g:message code="shipping.up_wt.label" default="Upwt" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="up_wt" required="" value="${fieldValue(bean: shippingInstance, field: 'up_wt')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shippingInstance, field: 'wt_based', 'error')} ">
	<label for="wt_based">
		<g:message code="shipping.wt_based.label" default="Wtbased" />
		
	</label>
	<g:checkBox name="wt_based" value="${shippingInstance?.wt_based}" />
</div>

