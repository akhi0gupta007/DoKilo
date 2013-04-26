<%@ page import="com.codebee.products.Books" %>



<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'sel_price', 'error')} required">
	<label for="sel_price">
		<g:message code="books.sel_price.label" default="Selprice" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="sel_price" required="" value="${fieldValue(bean: booksInstance, field: 'sel_price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="books.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${booksInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'list_price', 'error')} ">
	<label for="list_price">
		<g:message code="books.list_price.label" default="Listprice" />
		
	</label>
	<g:field type="number" name="list_price" value="${fieldValue(bean: booksInstance, field: 'list_price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="books.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" required="" value="${booksInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="books.image.label" default="Image" />
		
	</label>
	<g:textField name="image" value="${booksInstance?.image}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'vendor', 'error')} ">
	<label for="vendor">
		<g:message code="books.vendor.label" default="Vendor" />
		
	</label>
	<g:select id="vendor" name="vendor.id" from="${com.codebee.products.Vendor.list()}" optionKey="id" value="${booksInstance?.vendor?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="books.type.label" default="Type" />
		
	</label>
	<g:select id="type" name="type.id" from="${com.codebee.products.ProType.list()}" optionKey="id" value="${booksInstance?.type?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'weight', 'error')} ">
	<label for="weight">
		<g:message code="books.weight.label" default="Weight" />
		
	</label>
	<g:field type="number" name="weight" value="${fieldValue(bean: booksInstance, field: 'weight')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'dimen', 'error')} ">
	<label for="dimen">
		<g:message code="books.dimen.label" default="Dimen" />
		
	</label>
	<g:textField name="dimen" value="${booksInstance?.dimen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'pkg_dimen', 'error')} ">
	<label for="pkg_dimen">
		<g:message code="books.pkg_dimen.label" default="Pkgdimen" />
		
	</label>
	<g:textField name="pkg_dimen" value="${booksInstance?.pkg_dimen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'pro_id', 'error')} required">
	<label for="pro_id">
		<g:message code="books.pro_id.label" default="Proid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pro_id" required="" value="${booksInstance?.pro_id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'quan', 'error')} required">
	<label for="quan">
		<g:message code="books.quan.label" default="Quan" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="quan" required="" value="${fieldValue(bean: booksInstance, field: 'quan')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'avail', 'error')} ">
	<label for="avail">
		<g:message code="books.avail.label" default="Avail" />
		
	</label>
	<g:datePicker name="avail" precision="day"  value="${booksInstance?.avail}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'variants', 'error')} ">
	<label for="variants">
		<g:message code="books.variants.label" default="Variants" />
		
	</label>
	<g:select id="variants" name="variants.id" from="${com.codebee.products.Variants.list()}" optionKey="id" value="${booksInstance?.variants?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="books.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${booksInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'isbn13', 'error')} ">
	<label for="isbn13">
		<g:message code="books.isbn13.label" default="Isbn13" />
		
	</label>
	<g:textField name="isbn13" value="${booksInstance?.isbn13}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'binding', 'error')} ">
	<label for="binding">
		<g:message code="books.binding.label" default="Binding" />
		
	</label>
	<g:textField name="binding" value="${booksInstance?.binding}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'pub_date', 'error')} ">
	<label for="pub_date">
		<g:message code="books.pub_date.label" default="Pubdate" />
		
	</label>
	<g:datePicker name="pub_date" precision="day"  value="${booksInstance?.pub_date}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'publisher', 'error')} ">
	<label for="publisher">
		<g:message code="books.publisher.label" default="Publisher" />
		
	</label>
	<g:textField name="publisher" value="${booksInstance?.publisher}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'no_of_pages', 'error')} required">
	<label for="no_of_pages">
		<g:message code="books.no_of_pages.label" default="Noofpages" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="no_of_pages" required="" value="${fieldValue(bean: booksInstance, field: 'no_of_pages')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'language', 'error')} ">
	<label for="language">
		<g:message code="books.language.label" default="Language" />
		
	</label>
	<g:textField name="language" value="${booksInstance?.language}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'edition', 'error')} ">
	<label for="edition">
		<g:message code="books.edition.label" default="Edition" />
		
	</label>
	<g:textField name="edition" value="${booksInstance?.edition}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'data', 'error')} ">
	<label for="data">
		<g:message code="books.data.label" default="Data" />
		
	</label>
	<g:textField name="data" value="${booksInstance?.data}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'collection', 'error')} ">
	<label for="collection">
		<g:message code="books.collection.label" default="Collection" />
		
	</label>
	<g:select name="collection" from="${com.codebee.products.CustomCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${booksInstance?.collection*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'isbn', 'error')} ">
	<label for="isbn">
		<g:message code="books.isbn.label" default="Isbn" />
		
	</label>
	<g:textField name="isbn" value="${booksInstance?.isbn}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'ofo', 'error')} ">
	<label for="ofo">
		<g:message code="books.ofo.label" default="Ofo" />
		
	</label>
	<g:checkBox name="ofo" value="${booksInstance?.ofo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'ship_addr', 'error')} ">
	<label for="ship_addr">
		<g:message code="books.ship_addr.label" default="Shipaddr" />
		
	</label>
	<g:checkBox name="ship_addr" value="${booksInstance?.ship_addr}" />
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'smart', 'error')} ">
	<label for="smart">
		<g:message code="books.smart.label" default="Smart" />
		
	</label>
	<g:select name="smart" from="${com.codebee.products.SmartCollection.list()}" multiple="multiple" optionKey="id" size="5" value="${booksInstance?.smart*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'tax', 'error')} ">
	<label for="tax">
		<g:message code="books.tax.label" default="Tax" />
		
	</label>
	<g:checkBox name="tax" value="${booksInstance?.tax}" />
</div>

<div class="fieldcontain ${hasErrors(bean: booksInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="books.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.codebee.User.list()}" optionKey="id" required="" value="${booksInstance?.user?.id}" class="many-to-one"/>
</div>

