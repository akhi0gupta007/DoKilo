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
 <h2>Reach out your customers</h2>
<table>
    <tr>
        <td>
            <g:link action="show">
            <img src="<g:resource dir="images" file="news.png"/>" width="70" height="90"/> <br>
            NewLetters
            </g:link>
        </td>
    </tr>
</table>
</body>
</html>
