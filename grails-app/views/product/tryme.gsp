<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="product"/>
<script type="text/javascript" src="${createLinkTo(dir: 'js/dojo', file: 'dojo.js')}"
   djConfig="parseOnLoad:true, isDebug:true"></script>
<g:javascript>
   dojo.require("dojo.io.iframe");
</g:javascript>


<title>Insert title here</title>
</head>
<body>
  <div class="body">
  
<g:form name="uploadProductImageForm" method="post" action="uploadProductImage"
    enctype="multipart/form-data">
   <input type="hidden" name="id" value="${productInstance?.id}"/>
   <input type="file" name="newProductImage"/>
   <span class="button"><input class="add" type="button" name="uploadImage"
    value="Upload Image" onclick="submitForm()"/></span>
</g:form>

<script>
function submitForm() {
	   dojo.io.iframe.send({
	      form: 'uploadProductImageForm',
	      load: function (data) {
	         dojo.byId('productImage').innerHTML = data;
	      }
	   });
	}
</script>
  </div>
</body>
</html>
