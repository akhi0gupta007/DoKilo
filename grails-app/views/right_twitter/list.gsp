
<%@ page import="com.codebee.themes.Right_twitter" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right_twitter.label', default: 'Right_twitter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-right_twitter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-right_twitter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="no_of_tweets" title="${message(code: 'right_twitter.no_of_tweets.label', default: 'Nooftweets')}" />
					
						<g:sortableColumn property="show_widget" title="${message(code: 'right_twitter.show_widget.label', default: 'Showwidget')}" />
					
						<g:sortableColumn property="twit_title" title="${message(code: 'right_twitter.twit_title.label', default: 'Twittitle')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'right_twitter.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${right_twitterInstanceList}" status="i" var="right_twitterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${right_twitterInstance.id}">${fieldValue(bean: right_twitterInstance, field: "no_of_tweets")}</g:link></td>
					
						<td><g:formatBoolean boolean="${right_twitterInstance.show_widget}" /></td>
					
						<td>${fieldValue(bean: right_twitterInstance, field: "twit_title")}</td>
					
						<td>${fieldValue(bean: right_twitterInstance, field: "username")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${right_twitterInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
