<%@ page import="com.codebee.Profile" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="profile">
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <title>Domains</title>
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
   <script src="<g:resource dir="js" file="domains.js"></g:resource> "></script>
</head>
<body>

<div>
    <h2>Domains Configurations</h2>
    <p>
        Launch your store with your own <strong>Domains</strong>
        
    </p>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <p>
        Just Follow these instructions:
    </p>
    <ul>
        <li>Go to Your Domain Registrar configuration panel.</li>
        <li>Map your Domain with our server's IP Address <strong>176.58.103.120</strong></li>
        <li>Hurray, Your store is running now..</li>
    </ul>

   <g:if test="${domain}">
       <p>Your current domain is : <strong>${domain}</strong></p>
   </g:if>



       <form id="takeDomain" action="domainChange">
        <table>
            <tr>
                <td style="font-weight: bold;">Update Domain Information :
              www.<input type="text" name="domain" id="domain"> </td>
            </tr>
            <tr>
                <td>Enter valid Domain with proper prefix like .in,.com etc (eg. booksville.in,example.com)</td>
            </tr>
            <tr>

                <td><input type="button" value="Save" onclick="check()"></td>
            </tr>
        </table>
    </form>


</div>
</body>
</html>
