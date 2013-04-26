<%@ page import="com.codebee.themes.Right_twitter" %>



<div class="fieldcontain ${hasErrors(bean: right_twitterInstance, field: 'no_of_tweets', 'error')} ">
	<label for="no_of_tweets">
		<g:message code="right_twitter.no_of_tweets.label" default="Nooftweets" />
		
	</label>
	<g:field type="number" name="no_of_tweets" value="${fieldValue(bean: right_twitterInstance, field: 'no_of_tweets')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_twitterInstance, field: 'show_widget', 'error')} ">
	<label for="show_widget">
		<g:message code="right_twitter.show_widget.label" default="Showwidget" />
		
	</label>
	<g:checkBox name="show_widget" value="${right_twitterInstance?.show_widget}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_twitterInstance, field: 'twit_title', 'error')} ">
	<label for="twit_title">
		<g:message code="right_twitter.twit_title.label" default="Twittitle" />
		
	</label>
	<g:textField name="twit_title" value="${right_twitterInstance?.twit_title}" />
</div>

<div class="fieldcontain ${hasErrors(bean: right_twitterInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="right_twitter.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${right_twitterInstance?.username}" />
</div>

