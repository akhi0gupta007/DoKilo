<%@ page import="com.codebee.marketing.Blog" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="marketing">

    <title>NewsLetters</title>
    <style type="text/css">
    table {
        font: 11px/24px Verdana, Arial, Helvetica, sans-serif;

        width: 100%;
    }

    th {
        padding: 0 0.5em;
        text-align: left;
    }

    tr.yellow td {

        background: #FFC;
    }

    td {

        padding: 0 0.5em;
    }

    td.width {
        width: 300px;
    }

    td.adjacent {

        text-align: center;
    }
    </style>
</head>

<body>
<h2>Manage Live Templates</h2>
<g:if test="${flash.message}">
    <div class="message" style="background: #22db95; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
</g:if>

<table>
    <tr>
        <th>
            Name
        </th>
        <th>Subject</th>
        <th>Started On</th>
        <th>Periodicity</th>
        <th>Last Mail Sent</th>
        <th>Current Status</th>

    </tr>
    <g:each in="${live}" var="next">
        <tr>
            <td><g:link action="schedule" id="${next.newsLetters.id}">${next.newsLetters.name}</g:link> </td>
            <td>${next.newsLetters.subject}</td>
            <td>${next.dateCreated}</td>
            <td>${next.period}</td>
            <td>${next.lastSent}</td>
            <td>${next.active}</td>
            <td>
                <g:if test="${next.active}">
                    <g:remoteLink action="disable" id="${next.id}">
                        <strong>Disable Now</strong></g:remoteLink>
                </g:if>
                <g:else>
                    <g:remoteLink action="enable" id="${next.id}">
                        <strong>Enable Now</strong></g:remoteLink>
                </g:else>

            </td>

            <td><g:remoteLink action="logging" id="${next.id}"><strong>View Logs</strong></g:remoteLink> </td>
        </tr>
    </g:each>
</table>

</body>
</html>
