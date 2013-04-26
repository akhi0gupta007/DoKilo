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
        width: 190px;
    }

    td.adjacent {

        text-align: center;
    }
    </style>
</head>

<body>
<h2>Manage/Edit NewsLetter Templates</h2>
<table>
    <tr>
        <th>
            Name
        </th>
        <th>Subject</th>
        <th>Created On:</th>
    </tr>
    <g:each in="${news}" var="next">
        <tr>
            <td><g:link action="details" id="${next.id}">${next.name}</g:link> </td>
            <td>${next.subject}</td>
            <td>${next.dateCreated}</td>
            <td><g:link action="schedule" id="${next.id}">Make it Live</g:link> </td>
        </tr>
    </g:each>
</table>
<h3>Live Newsletters</h3>
<table>

    <g:each in="${live}" var="next">
        <tr>
            <td><g:link action="details" id="${next.id}">${next.name}</g:link> </td>
                  </tr>
    </g:each>
</table>
</body>
</html>
