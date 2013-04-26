
<%@ page import="com.codebee.themes.Right_twitter" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'right_twitter.label', default: 'Right_twitter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-right_twitter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-right_twitter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list right_twitter">
			
				<g:if test="${right_twitterInstance?.no_of_tweets}">
				<li class="fieldcontain">
					<span id="no_of_tweets-label" class="property-label"><g:message code="right_twitter.no_of_tweets.label" default="Nooftweets" /></span>
					
						<span class="property-value" aria-labelledby="no_of_tweets-label"><g:fieldValue bean="${right_twitterInstance}" field="no_of_tweets"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_twitterInstance?.show_widget}">
				<li class="fieldcontain">
					<span id="show_widget-label" class="property-label"><g:message code="right_twitter.show_widget.label" default="Showwidget" /></span>
					
						<span class="property-value" aria-labelledby="show_widget-label"><g:formatBoolean boolean="${right_twitterInstance?.show_widget}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_twitterInstance?.twit_title}">
				<li class="fieldcontain">
					<span id="twit_title-label" class="property-label"><g:message code="right_twitter.twit_title.label" default="Twittitle" /></span>
					
						<span class="property-value" aria-labelledby="twit_title-label"><g:fieldValue bean="${right_twitterInstance}" field="twit_title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${right_twitterInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="right_twitter.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${right_twitterInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${right_twitterInstance?.id}" />
					<g:link class="edit" action="edit" id="${right_twitterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
