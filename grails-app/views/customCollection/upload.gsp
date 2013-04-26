<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Upload Service</title>
</head>
<body>
  <div class="body">

<form action="uploadAction" enctype="multipart/form-data" method="post">
<table><tr><td>Name of Collection :<td><input type="text" name="name"/></tr>

<tr><td>Say Something about this:</td><td><textarea name="desc" rows="20" cols="5"></textarea></td></tr>
<tr><td>Upload an Image :<td><input type="file" name="photo"/></p></td></tr>
<tr><td><input type="submit" value="Upload"/></tr>

</table>
</form>
</body>
</html>
<a href="/codebee/persistence/logout">Logout</a>
</body>
  </div>
</body>
</html>