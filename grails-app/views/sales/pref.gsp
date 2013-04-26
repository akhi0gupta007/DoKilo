<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="sales"/>
<title>SALES</title>
</head>
<body>
  <div class="body">
   <h2 style="margin-left:15px;">Launch Your Store</h2>
   	 <g:if test="${flash.message}">
    <div class="message" style="background: #0080FF; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
   <a href="${createLink(action:'pref',
controller:'sales')}" target="_blank">Launch the Site</a>
     </g:if>
     <br>
      <g:if test="${themes}">
          <g:form action="select" >
              <label>Select Theme for your Store : </label>
              <g:select optionKey="id" optionValue="name" name="themes" from="${themes}" />
              <g:submitButton name="register" value="Select"/>
          </g:form>
      </g:if><g:else>
              You Have Not Created Any of your Personalised theme, <g:link controller="templates" action="site">Create here.</g:link> <br>
      </g:else>

      <br>
      <g:form action="select" >
          <label>Select <em>Admin Created <em>Theme for your Store : </label>
          <g:select optionKey="id" optionValue="name" name="themes" from="${admin}" />
          <g:submitButton name="register" value="Select"/>
      </g:form>
  </div>
</body>
</html>