
<%@ page import="com.codebee.products.Books" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'books.label', default: 'Books')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-books" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-books" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list books">
			
				<g:if test="${booksInstance?.sel_price}">
				<li class="fieldcontain">
					<span id="sel_price-label" class="property-label"><g:message code="books.sel_price.label" default="Selprice" /></span>
					
						<span class="property-value" aria-labelledby="sel_price-label"><g:fieldValue bean="${booksInstance}" field="sel_price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="books.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${booksInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.list_price}">
				<li class="fieldcontain">
					<span id="list_price-label" class="property-label"><g:message code="books.list_price.label" default="Listprice" /></span>
					
						<span class="property-value" aria-labelledby="list_price-label"><g:fieldValue bean="${booksInstance}" field="list_price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="books.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${booksInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="books.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${booksInstance}" field="image"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.vendor}">
				<li class="fieldcontain">
					<span id="vendor-label" class="property-label"><g:message code="books.vendor.label" default="Vendor" /></span>
					
						<span class="property-value" aria-labelledby="vendor-label"><g:link controller="vendor" action="show" id="${booksInstance?.vendor?.id}">${booksInstance?.vendor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="books.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="proType" action="show" id="${booksInstance?.type?.id}">${booksInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="books.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${booksInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.dimen}">
				<li class="fieldcontain">
					<span id="dimen-label" class="property-label"><g:message code="books.dimen.label" default="Dimen" /></span>
					
						<span class="property-value" aria-labelledby="dimen-label"><g:fieldValue bean="${booksInstance}" field="dimen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.pkg_dimen}">
				<li class="fieldcontain">
					<span id="pkg_dimen-label" class="property-label"><g:message code="books.pkg_dimen.label" default="Pkgdimen" /></span>
					
						<span class="property-value" aria-labelledby="pkg_dimen-label"><g:fieldValue bean="${booksInstance}" field="pkg_dimen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.pro_id}">
				<li class="fieldcontain">
					<span id="pro_id-label" class="property-label"><g:message code="books.pro_id.label" default="Proid" /></span>
					
						<span class="property-value" aria-labelledby="pro_id-label"><g:fieldValue bean="${booksInstance}" field="pro_id"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.quan}">
				<li class="fieldcontain">
					<span id="quan-label" class="property-label"><g:message code="books.quan.label" default="Quan" /></span>
					
						<span class="property-value" aria-labelledby="quan-label"><g:fieldValue bean="${booksInstance}" field="quan"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.avail}">
				<li class="fieldcontain">
					<span id="avail-label" class="property-label"><g:message code="books.avail.label" default="Avail" /></span>
					
						<span class="property-value" aria-labelledby="avail-label"><g:formatDate date="${booksInstance?.avail}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.variants}">
				<li class="fieldcontain">
					<span id="variants-label" class="property-label"><g:message code="books.variants.label" default="Variants" /></span>
					
						<span class="property-value" aria-labelledby="variants-label"><g:link controller="variants" action="show" id="${booksInstance?.variants?.id}">${booksInstance?.variants?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="books.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${booksInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.isbn13}">
				<li class="fieldcontain">
					<span id="isbn13-label" class="property-label"><g:message code="books.isbn13.label" default="Isbn13" /></span>
					
						<span class="property-value" aria-labelledby="isbn13-label"><g:fieldValue bean="${booksInstance}" field="isbn13"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.binding}">
				<li class="fieldcontain">
					<span id="binding-label" class="property-label"><g:message code="books.binding.label" default="Binding" /></span>
					
						<span class="property-value" aria-labelledby="binding-label"><g:fieldValue bean="${booksInstance}" field="binding"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.pub_date}">
				<li class="fieldcontain">
					<span id="pub_date-label" class="property-label"><g:message code="books.pub_date.label" default="Pubdate" /></span>
					
						<span class="property-value" aria-labelledby="pub_date-label"><g:formatDate date="${booksInstance?.pub_date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.publisher}">
				<li class="fieldcontain">
					<span id="publisher-label" class="property-label"><g:message code="books.publisher.label" default="Publisher" /></span>
					
						<span class="property-value" aria-labelledby="publisher-label"><g:fieldValue bean="${booksInstance}" field="publisher"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.no_of_pages}">
				<li class="fieldcontain">
					<span id="no_of_pages-label" class="property-label"><g:message code="books.no_of_pages.label" default="Noofpages" /></span>
					
						<span class="property-value" aria-labelledby="no_of_pages-label"><g:fieldValue bean="${booksInstance}" field="no_of_pages"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.language}">
				<li class="fieldcontain">
					<span id="language-label" class="property-label"><g:message code="books.language.label" default="Language" /></span>
					
						<span class="property-value" aria-labelledby="language-label"><g:fieldValue bean="${booksInstance}" field="language"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.edition}">
				<li class="fieldcontain">
					<span id="edition-label" class="property-label"><g:message code="books.edition.label" default="Edition" /></span>
					
						<span class="property-value" aria-labelledby="edition-label"><g:fieldValue bean="${booksInstance}" field="edition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="books.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:fieldValue bean="${booksInstance}" field="data"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.collection}">
				<li class="fieldcontain">
					<span id="collection-label" class="property-label"><g:message code="books.collection.label" default="Collection" /></span>
					
						<g:each in="${booksInstance.collection}" var="c">
						<span class="property-value" aria-labelledby="collection-label"><g:link controller="customCollection" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="books.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${booksInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.isbn}">
				<li class="fieldcontain">
					<span id="isbn-label" class="property-label"><g:message code="books.isbn.label" default="Isbn" /></span>
					
						<span class="property-value" aria-labelledby="isbn-label"><g:fieldValue bean="${booksInstance}" field="isbn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.ofo}">
				<li class="fieldcontain">
					<span id="ofo-label" class="property-label"><g:message code="books.ofo.label" default="Ofo" /></span>
					
						<span class="property-value" aria-labelledby="ofo-label"><g:formatBoolean boolean="${booksInstance?.ofo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.ship_addr}">
				<li class="fieldcontain">
					<span id="ship_addr-label" class="property-label"><g:message code="books.ship_addr.label" default="Shipaddr" /></span>
					
						<span class="property-value" aria-labelledby="ship_addr-label"><g:formatBoolean boolean="${booksInstance?.ship_addr}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.smart}">
				<li class="fieldcontain">
					<span id="smart-label" class="property-label"><g:message code="books.smart.label" default="Smart" /></span>
					
						<g:each in="${booksInstance.smart}" var="s">
						<span class="property-value" aria-labelledby="smart-label"><g:link controller="smartCollection" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.tax}">
				<li class="fieldcontain">
					<span id="tax-label" class="property-label"><g:message code="books.tax.label" default="Tax" /></span>
					
						<span class="property-value" aria-labelledby="tax-label"><g:formatBoolean boolean="${booksInstance?.tax}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${booksInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="books.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${booksInstance?.user?.id}">${booksInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${booksInstance?.id}" />
					<g:link class="edit" action="edit" id="${booksInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
