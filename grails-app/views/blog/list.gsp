<%@ page import="com.codebee.marketing.Blog" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="marketing">
    <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <style type="text/css">
    table {
        font: 11px/24px Verdana, Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    th {
        padding: 0 0.5em;
        text-align: left;
    }

    tr.yellow td {
        border-top: 1px solid #FB7A31;
        border-bottom: 1px solid #FB7A31;
        background: #FFC;
    }

    td {
        border-bottom: 1px solid #CCC;
        padding: 0 0.5em;
    }

    td.width {
        width: 190px;
    }

    td.adjacent {
        border-left: 1px solid #CCC;
        text-align: center;
    }
    </style>
</head>

<body>
<div id="list-blog" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="content" title="${message(code: 'blog.content.label', default: 'Content')}"/>

            <g:sortableColumn property="comments" title="${message(code: 'blog.comments.label', default: 'Comments')}"/>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'blog.dateCreated.label', default: 'Date Created')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${blogInstanceList}" status="i" var="blogInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${blogInstance.id}">${fieldValue(bean: blogInstance, field: "content")}</g:link></td>

                <td><g:formatBoolean boolean="${blogInstance.comments}"/></td>

                <td><g:formatDate date="${blogInstance.dateCreated}"/></td>
                
                <td>  <g:remoteLink action="ajaxDelete" id="${blogInstance.id}" update="[success:'message',failure:'error']"
                                    oncomplete="bookRemoved(${blogInstance.id});">delete</g:remoteLink></td>

            </tr>
        </g:each>
        </tbody>
    </table>


</div>
</body>
</html>
