<%@ page import="com.codebee.marketing.Blog" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="marketing">

    <title>Logs</title>
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
<h2>Sent Mail Logging Reports</h2>
<table>
   <thead>
   <th>
       NewsLetter
   </th>
   <th>
       Recipient
   </th>
   <th>
       Sent At
   </th>
   </thead>
   <g:each in="${logging}" var="next">
       <tr>
           <td>${next.newsLetters.name}</td>
           <td>${next.receiver}</td>
           <td>${next.sent}</td>
       </tr>
   </g:each>
</table>

</body>
</html>
