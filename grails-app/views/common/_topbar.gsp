<div id="menu">
<nobr>
<g:if test="${session.user}">
<b><g:link controller="user" action="home">Help</g:link>| <g:link action="create" controller="profile">Account Settings</g:link>|Welcome <u>${session.user?.userId}</u></b> |
<g:link controller="persistence" action="logout">Logout</g:link>

</g:if>
<g:else>
<a href = "${request.contextPath}">Login</a>
</g:else>
</nobr>
</div>
