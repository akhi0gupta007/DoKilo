<%@ page import="com.codebee.marketing.Blog" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>


<div id="show-blog" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list blog">

        <g:if test="${blogInstance?.content}">
            <li class="fieldcontain">
                <span id="content-label" class="property-label"><g:message code="blog.content.label"
                                                                           default="Content"/></span>

                <span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${blogInstance}"
                                                                                           field="content"/></span>

            </li>
        </g:if>

        <g:if test="${blogInstance?.comments}">
            <li class="fieldcontain">
                <span id="comments-label" class="property-label"><g:message code="blog.comments.label"
                                                                            default="Comments"/></span>

                <span class="property-value" aria-labelledby="comments-label"><g:formatBoolean
                        boolean="${blogInstance?.comments}"/></span>

            </li>
        </g:if>

        <g:if test="${blogInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="blog.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${blogInstance?.dateCreated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${blogInstance?.id}"/>
            <g:link class="edit" action="edit" id="${blogInstance?.id}"><g:message code="default.button.edit.label"
                                                                                   default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
