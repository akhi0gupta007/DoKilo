<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="homepage"/>
    <title>Home Page Preferences</title>

    <script type="text/javascript" src="${request.contextPath}/js/jscripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            document.getElementById("elm1").value = "<center>About Us</center>";
        });

        tinyMCE.init({
            mode : "textareas",
            theme : "simple"
        });
    </script>

</head>
<body>
<div class="body">

    <g:if test="${flash.message}">
        <div class="message" style="background: #22db95; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>

    <h2>About Us</h2>

    <g:form action="about" controller="homepage">
        <textarea id="elm1" name="elm1" rows="15" cols="100" style="width: 80%">

        </textarea>
        <br />
        <input type="submit" name="save" value="Submit" />
        <input type="reset" name="reset" value="Reset" />
    </g:form>

</div>
</body>
</html>