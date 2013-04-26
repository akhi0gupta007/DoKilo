<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="themes"/>
    <title>Modify Templates</title>

</head>
<body>
<div class="body">
    <h2>Show and Hide Products on your Store</h2>

    <g:if test="${flash.message}">
        <div class="message" style="background: #22db95; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>
    <p><b>Note:</b> If Parent Category is hidden then its <em>products</em> will be subsequently hidden.</p>
    <p>You can Hide/Unhide by edit these checkboxes.</p>
    <g:if test="${collection}">
        <g:form action="acceptProducts">
            <g:each in="${collection}" var="next">
                <g:if test="${next.showPro}">
                    <input type="checkbox" name="sel" value="${next.id}" checked="true">  ${next.title} &nbsp;
                </g:if>
                <g:else>
                    <input type="checkbox" name="sel" value="${next.id}" >    ${next.title}  &nbsp;
                </g:else>
            </g:each>
            <br><br>  <g:submitButton name="name" value="Save Preferences"/>
        </g:form>
    </g:if>
    <g:else>
        <h2>You Don't Have Any Product,<g:link controller="product" action="showing">Create One</g:link> </h2>
    </g:else>
</div>
</body>
</html>