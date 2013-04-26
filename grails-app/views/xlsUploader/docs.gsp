<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="product"/>
<title>Docs</title>
</head>
<body>
  <div class="body">
	<g:set var="counter" value="${1}" />	

  <table cellspacing='5' cellpadding='4'>
  <tr style="background-color:#ACC4E6;">
  <th>SNo.</th>
  <th>Doc</th><th>Date Created</th><th>Download</th>
  </tr>
    <g:each var="next" in="${docs }">
  <tr>
  <td>${counter }</td>
  <td>${next.title.substring(0,10) }</td>
  <td>${next.dateCreated.toString().substring(0,10)}</td>
  <td>
      <g:if env="production">
          <a href="/images/doc/${next.webpath}">Click here</a>
      </g:if>
      <g:else>
          <a href="<g:resource dir="doc" file="${next.webpath}" />">Click here</a>
      </g:else>



  </td>
  </tr>
  <g:set var="counter" value="${counter + 1}" />
  </g:each>
  </table>

  
  </div>
</body>
</html>