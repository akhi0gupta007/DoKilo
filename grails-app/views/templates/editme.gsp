<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="themes"/>
<title>Modify Templates</title>

</head>
<body>
  <div class="body">
  <h2>Show and Hide Categories on your Store</h2>

      <g:if test="${flash.message}">
          <div class="message" style="background: #22db95; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
      </g:if>
      <p><b>Note:</b> If Parent Category is hidden then its child will be subsequently hidden.</p>
      <p>You can Hide/Unhide by edit these checkboxes.</p>
     <g:if test="${collection}">
         <g:form action="accept">
          <g:each in="${collection}" var="next">
              <g:if test="${next.showColl}">
                    <input type="checkbox" name="sel" value="${next.id}" checked="true">  ${next.name} &nbsp;
              </g:if>
              <g:else>
                   <input type="checkbox" name="sel" value="${next.id}" >    ${next.name}  &nbsp;
              </g:else>
          </g:each>
           <br><br>  <g:submitButton name="name" value="Save Preferences"/>
         </g:form>
     </g:if>
     <g:else>
     <h2>You Don't Have Any Category Set,<g:link controller="customCollection" action="create">Create One</g:link> </h2>
     </g:else>
  </div>
</body>
</html>