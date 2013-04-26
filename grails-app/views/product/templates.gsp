<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>
    <title>Products</title>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>

    <script type="text/javascript">
        $(document).ready(function() {
           // $('#isbn').hide();
        });
    </script>

</head>
<body class="body">
<h2>Add Products by your templates</h2>
<ul>
<g:each in="${entries}" var="next">

   <li> <g:link class="edit" action="by" id="${next?.id}"> ${next.name}   </g:link></li>

</g:each>

</ul>
 <g:link controller="proTemplates" action="index">
     Create New Template
 </g:link>





</body>
<!--
<div id="list">

    <ul>
        <li><a href="#" id="books">Books</a></li>
    </ul>
    <a href="#" id="win">Create New Template</a>

</form>
</div>
<div id="isbn">
    <g:form action="books" controller="books">
        <label> Just Type the ISBN : <input type="text" id="" name="isbn"/> </label>
      <input type="submit" value="Search"/>
    </g:form>

</div>
-->
<script type="text/javascript">
    /*
     $('#books').click(function(event){
     event.preventDefault();
     $('#list').hide();
     $('#isbn').show();
     // console.log("ahahhh");
     });
     $('#win').click(function(event){
     event.preventDefault();
     var mywindow= window.open("${request.contextPath}/proTemplates/index","mywindow","location=1,status=1,scrollbars=1, width=800,height=400");
     //   mywindow.moveTo(100, 100);
     // console.log("ahahhh");
     });

     */
</script>

</html>