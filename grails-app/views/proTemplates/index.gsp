<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>

    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <title>Showing List</title>
    <script type="text/javascript">
       function close(){
         // alert("hu");
           window.close();
           //return false;
       }

    </script>

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

        padding: 5px;
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


     <h2 style="font-family: Helvetica" align="center">Product Template Wizard</h2>
<g:if test="${flash.message}">
    <div class="message" style="background: #ff275b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
</g:if>
<div>
    <form action="save" id="dont" method="post">
        <table cellpadding="5" cellspacing="5">
            <tr>
               <td style="font-weight: bold;">Template Name :</td>
            </tr>
            <tr>
               <td> <g:field type="text" name="name"></g:field></td>
                <td>
                    <input type="button" id="popup" value="Create New Attribute"  style="background-color: #C0C292; border: solid #797C45 1px;">
                </td>
            </tr>


            <tr>
                <td> <table id="templates" name="templates" cellpadding="5" cellspacing="4">

                </table>
                </td>
            </tr>

            <tr>
                <td> <input type="button" value="Create Template" id="temp"  style="background-color: #C0C292; border: solid #797C45 1px;"></td>
            </tr>
        </table>

        <br>
    </form>
    <script type="text/javascript" src="<g:resource dir="js" file="script1.js" />"></script>
   <!--
    <form>
        <input type="button" value="Close" onClick='self.close()'
               style="background-color: #C0C292; border: solid #797C45 1px;">
    </form>
    -->
</div>




</body>
</html>