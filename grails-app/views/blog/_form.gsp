<%@ page import="com.codebee.marketing.Blog" %>



<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'content', 'error')} required">
    <label for="content">
        <g:message code="blog.content.label" default="Content"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="content" cols="40" rows="5" maxlength="7000" required="" value="${blogInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'comments', 'error')} ">
    <label for="comments">
        <g:message code="blog.comments.label" default="Comments"/>

    </label>
    <g:checkBox name="comments" value="${blogInstance?.comments}"/>
</div>

