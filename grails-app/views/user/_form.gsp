<%@ page import="com.codebee.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userId', 'error')} required">
	<label for="userId">
		<g:message code="user.userId.label" default="User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userId" maxlength="15" required="" value="${userInstance?.userId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="12" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'emailId', 'error')} required">
	<label for="emailId">
		<g:message code="user.emailId.label" default="Email Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="emailId" required="" value="${userInstance?.emailId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="user.profile.label" default="Profile" />
		
	</label>
	<g:select id="profile" name="profile.id" from="${com.codebee.Profile.list()}" optionKey="id" value="${userInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'collection', 'error')} ">
	<label for="collection">
		<g:message code="user.collection.label" default="Collection" />
		
	</label>
	<g:select name="collection" from="${com.codebee.products.CustomCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.collection*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'proType', 'error')} ">
	<label for="proType">
		<g:message code="user.proType.label" default="Pro Type" />
		
	</label>
	<g:select name="proType" from="${com.codebee.products.ProType.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.proType*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'product', 'error')} ">
	<label for="product">
		<g:message code="user.product.label" default="Product" />
		
	</label>
	<g:select name="product" from="${com.codebee.products.Product.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.product*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'smartcollection', 'error')} ">
	<label for="smartcollection">
		<g:message code="user.smartcollection.label" default="Smartcollection" />
		
	</label>
	<g:select name="smartcollection" from="${com.codebee.products.SmartCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.smartcollection*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'templates', 'error')} ">
	<label for="templates">
		<g:message code="user.templates.label" default="Templates" />
		
	</label>
	<g:select name="templates" from="${com.codebee.themes.Templates.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.templates*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'variants', 'error')} ">
	<label for="variants">
		<g:message code="user.variants.label" default="Variants" />
		
	</label>
	<g:select name="variants" from="${com.codebee.products.Variants.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.variants*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'vendor', 'error')} ">
	<label for="vendor">
		<g:message code="user.vendor.label" default="Vendor" />
		
	</label>
	<g:select name="vendor" from="${com.codebee.products.Vendor.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.vendor*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'xlsUploader', 'error')} ">
	<label for="xlsUploader">
		<g:message code="user.xlsUploader.label" default="Xls Uploader" />
		
	</label>
	<g:select name="xlsUploader" from="${com.codebee.products.XlsUploader.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.xlsUploader*.id}" class="many-to-many"/>
</div>

