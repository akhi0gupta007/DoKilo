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


<div id="header">
<h1> ${session.dummy.userId} Store</h1>
</div>
<div id="topbar1">
<g:render template="/common/sitebar" />
</div>

<div id="content">
<g:layoutBody />
</div>


</div>
</body>
</html>
