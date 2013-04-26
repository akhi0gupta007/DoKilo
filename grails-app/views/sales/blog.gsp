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
            <g:each var="next" in="${blog}">

                <tr style="font-size: 18;">
                    <td>${next.content}</td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td> Written On:  ${next.dateCreated}
                    </td>
                </tr>
                <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>

                <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

            </g:each>     
        </g:if>
        <g:else>
            No Blog Created
        </g:else>
    </table>

    </div>
   </body>
</html>