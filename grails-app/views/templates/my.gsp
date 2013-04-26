<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="themes"/>
<title>My STORE Profiles</title>
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
   <h2 style="margin-left:15px;">My Store Profiles</h2>
      <g:if test="${set instanceof com.codebee.themes.Templates}">
          <h3>Currently set Store is : ${set.name}</h3>
      </g:if>

      <g:if test="${flash.message}">
          <div class="message" style="background: #ff275b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
      </g:if>
      <g:if test="${themes}">
          <g:form action="now" method="post" >
              <table>
                  <tr>
                      <th>
                          Select
                      </th>
                      <th>
                          Profile Name
                      </th>
                      <th>
                          Store Name
                      </th>
                      <th>
                          Logo
                      </th>
                      <th>
                          Created on
                      </th>
                  </tr>
                  <g:each in="${themes}" var="next">
                      <tr>
                          <td>
                              <input type="radio" name="theme" value="${next.id}">
                          </td>
                          <td>
                              ${next.name}
                          </td>
                          <td>
                              ${next.storeName}
                          </td>
                          <td>

                              <g:if env="production">
                                  <img src="/images/logo/${next.logo}" alt="image" width="20" height="20"/>
                              </g:if>
                              <g:else>
                                  <image src="<g:resource dir="images/logo" file="${next.logo}" />" width="20" height="20"/>
                              </g:else>


                          </td>
                          <td>
                              ${next.dateCreated}
                          </td>
                      </tr>
                  </g:each>
                  <tr>
                      <td>	<g:submitButton name="register" value="Select"/></td>
                  </tr>
              </table>


          </g:form>
      </g:if>
      <g:else>
           <h3>You Don't have Any Store Profile, <g:link action="site">Create One</g:link>
      </g:else>

  </div>
</body>
</html>