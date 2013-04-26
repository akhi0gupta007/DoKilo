<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
  <g:uploadForm action="upload">
  Photo:<input name="photo" type="file"/>
  <g:submitButton name="upload" value="upload"/>
  </g:uploadForm>
  </div>
</body>
</html>