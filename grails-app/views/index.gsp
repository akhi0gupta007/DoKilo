<html>
<head>

    <script language="JavaScript" src="js/gen_validatorv4.js"
            type="text/javascript" xml:space="preserve"></script>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
<script>

    $(document).ready(function() {
          $('#log').hide();
        setInterval(smena, 11800);
    });

    function smena(){
        $('.message').animate({opacity:0},2500,function(){
            setTimeout (function() {
                $('.wrapper').animate({opacity:1},2500)
            },5000)
        });
    }

</script>
<title>DoKilo Online Web store</title>
<meta name="layout" content="main" />
</head>
<body>


<p>
    Welcome to DoKilo Online Web store, Here you can create your store on the fly within a minutes.Add your Products, Variants, Manage
    your categorisation, Manufacturers and much more.
</p>
 <p>
     Choose from Themes and launch your Store.Hide/ Un-hide Products/Category based on your requirement.Drag and Drop shopping cart
 </p>
<br />

<div id="reg">
<p style="margin-left:20px;width:80%">
    <g:if test="${flash.message}">
        <div class="message" style="background: #ff275b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>
<b>Register here to continue</b>
</p>
<form action="" method="post" id="register" name="register">
<table>

<tr>
<td style="margin-left:20px;">Choose your Id : <input type="text" id="userId" name="userId"/><div id='register_userId_errorloc' class="error_strings"></div></td>
</tr>
<tr>
<td style="margin-left:20px;">Your Password: <input type="password" id="password" name="password"/><div id='register_password_erroloc' class="error_strings"></div></td>
</tr>
<tr>
<td style="margin-left:20px;">Your Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" id="emailId" name="emailId"/><div id='register_emailId_errorloc' class="error_strings"></div></td>
</tr>
<tr>
<td align="center"><input type="submit" value="Create"/></td><td>
<input type="button" id="login" value="Login,i have Account"/>
</td>
</tr>
</form>
</table>
</div>

<div id="log">

<form action="auth/authUser" method="post" name="myform" id="myform">
<p>User id &nbsp;&nbsp;&nbsp;:<input type="text" name="userId"/><div id='myform_userId_errorloc' class="error_strings"></div></p>
<p>Password:<input type="password" name="password"/><div id='myform_password_errorloc' class="error_strings"></div></p>
<p><input type="submit" value="login"/></p>
</form>

</div>
<script>
    var frmvalidator  = new Validator("myform");
    frmvalidator.EnableOnPageErrorDisplay();
    frmvalidator.EnableMsgsTogether();

    frmvalidator.addValidation("userId","req","Please enter your UserID");
    frmvalidator.addValidation("userId","maxlen=20",	"Max length for FirstName is 20");

    frmvalidator.addValidation("password","maxlen=50");
    frmvalidator.addValidation("password","req");
   // frmvalidator.addValidation("Email","email");

    var frmvalidator1  = new Validator("register");
    frmvalidator1.EnableOnPageErrorDisplay();
    frmvalidator1.EnableMsgsTogether();

    frmvalidator1.addValidation("userId","req","Please enter your UserID");
    frmvalidator1.addValidation("userId","maxlen=20",	"Max length for FirstName is 20");

    frmvalidator1.addValidation("password","maxlen=12");
    frmvalidator1.addValidation("password","req");
    frmvalidator1.addValidation("emailId","emailId");

$("#register").submit(function(event) {
		
		var user =	$("#userId").val();
		var password = $("#password").val();
		var email = $("#emailId").val(); 
		var url = "user/addUser?u="+user+"&p="+password+"&em="+email;
		$("#register").attr("action",url);				
		$("#register").submit();	 
		event.preventDefault();
     
});

$('#login').click(function() {
  $('#reg').hide('slow', function() {
     });
  $('#log').show();	   
});
</script>

<br />

</body>
</html>
