<html>
<head>
<title><g:layoutTitle default="Collab Todo" />
</title>
<link rel="stylesheet"
href="${createLinkTo(dir:'css',file:'site.css')}" />
<link rel="shortcut icon"
href="${createLinkTo(dir:'images',file:'favicon.ico')}"
type="image/x-icon" />
<g:layoutHead />
<g:javascript library="application" />
</head>
<body>
<div id="page">
<div id="spinner" class="spinner" style="display: none;">
<img src="${createLinkTo(dir:'images',
file:'spinner.gif')}"
alt="Spinner" />
</div>
    <div id="cus">
        <g:render template="/common/customer" />
    </div>

<div id="header">
    <h1>
        <g:if test="${storeName}">
            ${storeName}
        </g:if>
        <g:else>
            Undefined
        </g:else>
    </h1>

</div>

<div id="cart_container">
<g:render template="/common/sitefooter" />
</div>
<div id="topbar1">
<g:render template="/common/sitebar" />
</div>
<div id="maincontainer">
<div id="content">
<g:layoutBody />
</div>
<div id="sidebar">
<g:render template="/common/site" />
</div>
<div style="clear:both;"></div>
</div><!-- end of main container -->
</div>
</body>
</html>
