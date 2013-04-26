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
        padding: 10px;
        text-align: left;
    }

    tr.yellow td {

        background: #FFC;
    }

    td {

        padding: 10px;
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
<h2>Step 2 : Put the newsletter on work</h2>
<g:if test="${flash.message}">
    <div class="message" style="background: #d92f3b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
</g:if>
<g:form action="set">
<table>
    <tr>
        <td style="font-weight: bold;">How often it should be sent ?</td>
        <td>
            <select name="period">
                <option value="weekly">Weekly</option>
                <option value="monthly">Monthly</option>
                <option value="yearly">Yearly</option>
            </select>
        </td>
        </tr>
    <tr>
        <td style="font-weight: bold;">Activate Now : <input type="checkbox" name="active" checked="true"></td>
    </tr>
    <tr>
        <td>
            <input type="submit" value="Set Now"/>
            <input type="hidden" value="${x}" name="id">
        </td>
    </tr>
</table>
</g:form>
</body>
</html>
