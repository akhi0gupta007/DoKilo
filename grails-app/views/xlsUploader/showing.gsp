<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="product"/>
<title>XLS Uploader</title>
</head>
<body>
  <div class="body">
  <form action="${request.contextPath}/xlsUploader/handle" enctype="multipart/form-data" method="post" id="xlsf">
	<p>File:<input type="file" name="xls"/></p>
	<p><input type="submit" value="Upload"/></p>
</form>
  </div>
</body>
</html>