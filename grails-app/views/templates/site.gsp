<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="themes"/>
<title>Store Configurations</title>
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
  
    <h2>Store launching wizard</h2>
      <p>
          <u>Select the preferences for the store</u>
      </p>
    <g:uploadForm action="saveProfile">


        <g:if test="${flash.message}">
            <div class="message" style="background: #ff275b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
        </g:if>
    <table cellpadding="4">
        <tr>

            <td  style="font-weight: bold;">
                Step 1 : What is your Store Name ? (Optional, else your username will be displayed)

            </td>

        </tr>
        <tr>
            <td>
               <input name="store" placeholder="Store Name" type="text">
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold;">
                Step 2 : Select The Logo (Optional)

            </td>
        </tr>
        <tr>
            <td>
                <input name="image" type="file" />
            </td>
        </tr>
        <tr>
            <td  style="font-weight: bold;">
                Step 3 : Select The Theme

            </td>
        </tr>
        <tr>
        <td>
            <g:set var="counter" value="${0}">

            </g:set>
            <g:each in="${templates}" var="next">
                 <g:if test="${counter == 0}">
                     ${next.name} <input type="radio" name="theme" value="${next.id}" checked>
                 </g:if>
                <g:else>
                    ${next.name} <input type="radio" name="theme" value="${next.id}">
                </g:else>
              <%
                  ++counter;
                  %>

            </g:each>
            <input type="button" value="View Preview" style="background-color: #439bc2; border: solid #797C45 1px;">
        </td>
        </tr>
        <tr>
            <td  style="font-weight: bold;">
                Step 4 : Give it a name, save multiple profiles

            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="name" placeholder="Theme Name">
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="Save Preferences">
            </td>
        </tr>
    </table>


    </g:uploadForm>
  </div>
</body>
</html>