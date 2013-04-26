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

    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-ui-1.8.9.custom.min.js" />"></script>
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
<body style="background-color: #E643DB;">
     <div style="padding: 10px;">
         <g:if test="${flash.message}">
             <div class="message" style="background: #ff275b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
         </g:if>
         <h1 align="center" style="font-weight: bold;">Registration Page</h1>  <br><br>
         <table align="center" cellpadding="10">
             <tr>
                 <td>
                     <g:form action="login">
                         <table>
                             <tr>
                                 <th style="font-weight: bold;">Login Now</th>
                             </tr>
                             <tr>
                                 <td>User ID :&nbsp;&nbsp;&nbsp;&nbsp;<g:textField name="cusUserId"></g:textField></td>

                             </tr>
                             <tr>
                                 <td>
                                     Password : <g:passwordField name="cusPassword" />
                                 </td>

                             </tr>
                             <tr>
                                 <td>
                                     <g:submitButton name="sub" value="Login"></g:submitButton>
                                 </td>
                             </tr>
                         </table>
                     </g:form>
                 </td>
                 <td>
                     <g:form action="customers">
                         <table>
                             <tr>
                                 <th style="font-weight: bold;">Register For Benefits</th>
                             </tr>
                             <tr>
                                 <td>User ID :&nbsp;&nbsp;&nbsp;&nbsp;<g:textField name="cusUserId"></g:textField></td>

                             </tr>
                             <tr>
                                 <td>
                                     Password : <g:passwordField name="cusPassword" />
                                 </td>

                             </tr>
                             <tr>
                                 <td>
                                    Email ID : &nbsp;  <g:textField name="cusEmailId"></g:textField>
                                 </td>
                             </tr>
                             <tr>
                                 <td>
                                     <g:submitButton name="sub" value="Login"></g:submitButton>
                                 </td>
                             </tr>
                         </table>
                     </g:form>
                 </td>
             </tr>

         </table>

     </div>


        <div style="clear: both;"></div>

</body>
</html>
