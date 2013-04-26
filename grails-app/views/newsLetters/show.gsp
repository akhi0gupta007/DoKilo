<%@ page import="com.codebee.marketing.Blog" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="marketing">

    <title>NewsLetters</title>
    <style type="text/css">
    table {
        font: 11px/24px Verdana, Arial, Helvetica, sans-serif;

        width: 100%;
    }

    th {
        padding: 0 0.5em;
        text-align: left;
    }

    tr.yellow td {

        background: #FFC;
    }

    td {

        padding: 0 0.5em;
    }

    td.width {
        width: 190px;
    }

    td.adjacent {

        text-align: center;
    }
    </style>

    <script type="text/javascript" src="${request.contextPath}/js/jscripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var output
            $.get("${request.contextPath}/newsletter.html", function(response) {
                document.getElementById("elm1").value = response;
            });


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

    <h3>Step 1: Modify the Template</h3>

    <g:form action="save">
       <label><strong>Subject to be sent while sending mail:</strong></label><input type="text" value="My NewsLetters" name="subject"> <br><br>
        <label><strong>Provide any Name (For saving as your template):</strong></label><input type="text" value="Mobile Promotion" name="name"> <br><br>
        <textarea id="elm1" name="content" rows="15" cols="100" style="width: 100%">

        </textarea>
        <br />
        <input type="submit" name="save" value="Save and Continue" />

    </g:form>

</div>
</body>
</html>
