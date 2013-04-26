<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="product"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<title>Collection</title>
<script>
$(document).ready(function() {

	//makeCollectionTable(userid); //make collection table
});
</script>
<script type="text/javascript" src="/codebee/js/script.js"></script>
</head>
<body>
  <div class="body">
  
    <g:if test="${flash.message}">
    <div class="message" style="background: #0080FF; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
     </g:if>
     <ul>
     <g:each var="next" in="${customCollectionInstanceList}">
 <li><h3><g:link action="showp" id="${next.id}">${next.name}</g:link></h3> </li>
 
 </g:each>
     </ul><br>
 <g:link action="create">Create New Collecton ></g:link>
 <br> <br>
  </div>
</body>
</html>