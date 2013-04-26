<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>
    <title>${demo}</title>
</head>
<body>
<div class="body">
    <h1 style="margin-left:20px;">${demo.name}</h1><hr>
    <g:uploadForm action="change">
    <label>
        Edit Title
    </label>
    <input type="text" value="${demo.name}" name="name">  <br>     <br>
      Say Something about this  <g:textArea name="description" rows="3" cols="40" value="${demo?.description}"/></td><br>   <br>
    <label>
        You might want to change image
    </label>
        <g:hiddenField name="id" value="${params.id}" />   <input type="file" name="image">
        <br>
 <br><g:submitButton name="Save" value="Save"/><br>

    </g:uploadForm>
    <h3>Sub Categories for this Category</h3>

    <g:each var="next" in="${entries}">
        <li><g:link action="showp" id="${next.id}">${next.name}</g:link> </li>

    </g:each>

</div>
</body>
</html>