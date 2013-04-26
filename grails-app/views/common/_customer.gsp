<script type="text/javascript" src="<g:resource dir="js" file="script1.js" />"></script>
<script type="text/javascript">
    $(document).ready(function()
    {
        $("img[rel]").overlay();
        path = "${request.contextPath}"
    });
</script>
<div id="menu">
    <nobr>
        <g:if test="${session.customer}">
            <b><g:link action="create" controller="profile">Account Settings</g:link>|Welcome <u>${session.customer?.cusUserId}</u></b> |
            <g:link controller="sales" action="logout">Logout</g:link>

        </g:if>
        <g:else>
        Hello Guest User, <g:link controller="sales" action="register">Login</g:link> ,if you have account.Or  <g:link controller="sales" action="register">
            Register </g:link>
        </g:else>
    </nobr>

    <g:remoteLink controller="sales" action="just" onSuccess="showCart()">
    <b>My Cart</b>    <img src="<g:resource dir="images" file="cart.jpg"/> " rel="#mies1" width="50" height="50"/>
    </g:remoteLink>
</div>
