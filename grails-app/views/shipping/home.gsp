<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="logistics"/>
    <title>Logistics</title>

    <style type="text/css">
    table {
        font: 11px/24px Verdana, Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 80%;
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
<div class="body">
    <g:if test="${flash.message}">
        <div class="message" style="background: #0080FF; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>

    <table>
        <tr>
            <th>My Existing Plans</th>
        </tr>
<g:each var="next" in="${arr}">
    <tr>
        <td>${next.plan}</td>
        <g:if test="${next.wt_based}">
            <td>Weight based ,${next.lo_wt}kg - ${next.up_wt}kg</td>
        </g:if>
        <g:else>
            <td>Price based ,${next.lo_price}INR - ${next.up_price}INR</td>
        </g:else>
        <td>${next.price}</td>

      <td>
          <g:remoteLink action="ajaxDelete" id="${next.id}" update="[success:'message',failure:'error']"
                        oncomplete="bookRemoved(${next.id});"><img src="${request.contextPath}/images/delete.png" alt=""></g:remoteLink>
      </td>
    </tr>
    </g:each>
    </table>


    <div id="message" class="error"></div>
    <div id="error" class="error"></div>



 </div>
</body>
</html>