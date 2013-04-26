<%@ page import="com.codebee.Profile" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="profile">

    <title>Profile</title>
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

        padding: 2px;
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

<div>
    <h2>Updating Password</h2>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
           <g:form action="passwordChange">
               <table>
                   <tr>
                       <td>Old Password</td>
                       <td><input type="password" name="old_password"></td>
                   </tr>
                   <tr>
                       <td>New Password</td>
                       <td><input type="password" name="new_password"></td>
                   </tr>
                   <tr>

                       <td><input type="submit" value="Change"></td>
                   </tr>
               </table>
           </g:form>


</div>
</body>
</html>
