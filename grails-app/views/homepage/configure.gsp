<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="homepage"/>
    <title>Home Page Preferences</title>
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

        background: #FFC;
    }

    td {

        padding: 4px;
    }

    td.width {
        width: 100%;
    }

    td.adjacent {
        border-left: 1px solid #CCC;
        text-align: center;
    }
    </style>
</head>
<body>
<div class="body">

    <g:if test="${flash.message}">
        <div class="message" style="background: #22db95; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>

    <h2>Home Page Preferences</h2>

    <g:form action="save" method="post">
        <table cellpadding="4">
            <tr>

                <td  style="font-weight: bold;">
                   Maximum Number of Products to be displayed :
                   <g:if test="${max}">
                       <input name="max_no_items" placeholder="max_no_items" type="text" value="${max}" size="5">
                   </g:if>
                    <g:else>
                        <input name="max_no_items" placeholder="max_no_items" type="text" value="15" size="5">
                    </g:else>

                </td>

            </tr>

            <tr>

                <td  style="font-weight: bold;">
                    <g:if test="${featured}">
                        Show Featured Products : <input type="checkbox" name="featured" checked="true" value="true">   
                    </g:if>
                    <g:else>
                        Show Featured Products : <input type="checkbox" name="featured" value="true">
                    </g:else>

                </td>
             </tr>
            <tr>

                <td  style="font-weight: bold;">
                    <g:if test="${search}">
                        Show Search Bar : <input type="checkbox" name="search" checked="true" value="true">
                    </g:if>
                    <g:else>
                        Show Search Bar : <input type="checkbox" name="search"  value="true">
                    </g:else>


                </td>

            </tr>
            <tr>

                <td  style="font-weight: bold;">
                    <g:if test="${recently}">
                        Show Recently Added : <input type="checkbox" name="recently" checked="true" value="true">
                    </g:if>
                    <g:else>
                        Show Recently Added : <input type="checkbox" name="recently" value="true">
                    </g:else>


                </td>

            </tr>
            <tr>
                <td>
                    <input type="submit" value="Save Preferences">
                </td>
            </tr>
        </table>
    </g:form>
</div>
</body>
</html>