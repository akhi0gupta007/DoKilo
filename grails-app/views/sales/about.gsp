<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="site"/>
    <title>
        <g:if test="${storeName}">
            ${storeName}
        </g:if>
        <g:else>
            Undefined
        </g:else>

    </title>
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
        width: 100%;
    }

    td.adjacent {

        text-align: center;
    }
    </style>
</head>
<body>
<div class="body">
    <table cellpadding="5" cellspacing="5">
        <g:if test="${blog}">
               <thead>
               <th>
                   About Us
               </th>
               </thead>

                <tr style="font-size: 18;">
                    <td>${blog}</td>
                </tr>
                <tr><td></td></tr>
                         
        </g:if>
        <g:else>
            No About Us Created
        </g:else>
    </table>

</div>
</body>
</html>