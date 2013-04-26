
<%@ page import="com.codebee.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-profile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'profile.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'profile.country.label', default: 'Country')}" />
					
						<g:sortableColumn property="expertise" title="${message(code: 'profile.expertise.label', default: 'Expertise')}" />
					
						<g:sortableColumn property="fullName" title="${message(code: 'profile.fullName.label', default: 'Full Name')}" />
					
						<g:sortableColumn property="mobile" title="${message(code: 'profile.mobile.label', default: 'Mobile')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'profile.phone.label', default: 'Phone')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${profileInstanceList}" status="i" var="profileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${profileInstance.id}">${fieldValue(bean: profileInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: profileInstance, field: "country")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "expertise")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "fullName")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "mobile")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "phone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
