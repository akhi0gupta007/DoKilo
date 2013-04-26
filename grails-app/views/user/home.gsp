<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Home Page</title>
<style type="text/css">

</style>

</head>
<body> <!-- Sets the persistant cookie,don't call anywhere else -->
<script type="text/javascript" src="/codebee/js/script.js"></script>
  <div class="body">
    <p style="margin-left:20px;width:80%">
      <g:if test="${flash.message}">
          <div class="message" style="background: #ff275b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
      </g:if>
       <h3 style="margin-left:20px;width:80%">Open your Store in some few easy steps</h3>
    </p>
      <br />
      <div id="list6">
      <ol style="margin-left:20px;width:80%;padding: 3px;">
         <li>Create Products for your store,<g:link controller="product" action="showing"> go here , </g:link>Or Create templates by
         <g:link controller="proTemplates" action="index"> Templates </g:link></li>

          <li>View And Configure your Product,<g:link controller="product" action="another">Click here.</g:link> </li>
          <li><g:link controller="templates" action="site">Create</g:link> your Store and configure it looks </li>
          <li><g:link controller="homepage" action="configure">Customise</g:link> your Homepage.Add <g:link controller="homepage" action="featured">
              Featured
          </g:link>  Listing</li>
          <li>Then, <g:link controller="sales" action="store">Launch</g:link> your Store. </li>
      </ol>
          </div>
<p >

<h2 style="margin-left:20px;width:80%">Click the menus to Get Started -></h2>
    <g:link action="create" controller="profile">  <h3 style="margin-left:20px;width:80%">Create My Profile/Update Password</h3></g:link>
</p>

  </div>
</body>
</html>