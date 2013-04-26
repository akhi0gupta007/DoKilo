<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="themes"/>
    <title>Modify Templates</title>

</head>
<body>
<div class="body">
    <h2>Show and Hide Brands on your Store</h2>
    <g:if test="${flash.message}">
        <div class="message" style="background: #22db95; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>

    <p>You can Hide/Unhide by edit these checkboxes.</p>
    <g:if test="${collection}">
        <g:form action="acceptVendor">
            <g:each in="${collection}" var="next">
                <g:if test="${next.showColl}">
                    <input type="checkbox" name="sel" value="${next.id}" checked="true">  ${next.ven_name} &nbsp;
                </g:if>
                <g:else>
                    <input type="checkbox" name="sel" value="${next.id}" >    ${next.ven_name}  &nbsp;
                </g:else>
            </g:each>
            <br><br>  <g:submitButton name="name" value="Save Preferences"/>
        </g:form>
    </g:if>
    <g:else>
        <h2>You Don't Have Any Category Set,<g:link controller="customCollection" action="create">Create One</g:link> </h2>
    </g:else>
</div>
</body>
</html>