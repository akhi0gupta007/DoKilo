<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="product"/>
<title>Showing List</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<style type="text/css">
table {
    font: 11px/24px Verdana, Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 620px;
}

th {
    padding: 0 0.5em;
    text-align: left;
}

tr.yellow td {
    border-top: 1px solid #FB7A31;
    border-bottom: 1px solid #FB7A31;
    background: #FFC;
}

td {
    border-bottom: 1px solid #CCC;
    padding: 0 0.5em;
}

td.width {
    width: 190px;
}

td.adjacent {
    border-left: 1px solid #CCC;
    text-align: center;
}
</style>
<script>
$(document).ready(function() {
	var userid = "${session.user?.id}";
	hello(userid);	
});

</script>
<script type="text/javascript" src="/codebee/js/script.js"></script>
</head>
<body>
  <div class="body">
  
   <div id="show">
   
   <h3>Showing Your Products</h3>
   <table id="protype1" name="protype1" cellpadding="5" cellspacing="4">
		 <tr><th>Select</th><th>Product ID </th>
		     <th>Product Title </th><th>Sell Price</th><th>Description</th>
		             <th>Vendor</th></tr>
 
 </table>
   </div>
   
  </div>
</body>
</html>