<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="themes"/>
    <title>Demo Store</title>

</head>
<body>
<div class="body">
    <h2>Launching Store</h2>

    <g:if test="${flash.message}">
        <div class="message" style="background: #22db95; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>

    <g:if test="${store}">
       Store Profile : ${store.name}  <br>  <br>
        <g:link controller="sales" action="store" target="_blank">
            Open Store Now
        </g:link>
    </g:if>
</div>
</body>
</html>