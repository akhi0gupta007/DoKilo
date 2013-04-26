
<%@ page import="com.codebee.SiteAdmin" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteAdmin.label', default: 'SiteAdmin')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-siteAdmin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-siteAdmin" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="userId" title="${message(code: 'siteAdmin.userId.label', default: 'User Id')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'siteAdmin.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="emailId" title="${message(code: 'siteAdmin.emailId.label', default: 'Email Id')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'siteAdmin.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteAdminInstanceList}" status="i" var="siteAdminInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteAdminInstance.id}">${fieldValue(bean: siteAdminInstance, field: "userId")}</g:link></td>
					
						<td>${fieldValue(bean: siteAdminInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: siteAdminInstance, field: "emailId")}</td>
					
						<td><g:formatDate date="${siteAdminInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteAdminInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
