<%@ page import="com.codebee.products.CustomCollectionController; com.codebee.products.CustomCollection" contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="product"/>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
<title>Collection</title>
    <style type="text/css">

    </style>
<script>
$(document).ready(function() {
    $('#dhtmlgoodies_tree').hide();
	//makeCollectionTable(userid); //make collection table
});
</script>
    <script type="text/javascript" src="<g:resource dir="js" file="script1.js" />"></script>

</head>
<body>
  <div class="body">

      <h3 style="margin-left:20px;width:80%">Showing Various Categories</h3>



    <g:if test="${flash.message}">
    <div class="message" style="background: #0080FF; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
     </g:if>



      <g:set var="status" value="false"/>
      <ul>
      <g:each in="${customCollectionInstanceList}" var="next">
        <li>
         <g:link action="showp" id="${next.id}">${next.name}</g:link>
            <g:if test="${CustomCollectionController.hasChild(next) == 'true' && next instanceof CustomCollection}">
                ${CustomCollectionController.makeList(next,request.contextPath)}
            </g:if>
        </li>
      </g:each>
      </ul>
    <br>
 <g:link action="create">Create New Collecton ></g:link>
 <br> <br>
  </div>

</body>
</html>