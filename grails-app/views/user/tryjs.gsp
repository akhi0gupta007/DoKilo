<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
 
  
	<form method=post action=https://api-3t.sandbox.paypal.com/nvp> 
 <input type=hidden name=USER value=akhi_1332239329_biz_api1.gmail.com> 
 <input type=hidden name=PWD value=1332239355> 
 <input type=hidden name=SIGNATURE value=ACUe-E7Hjxmeel8FjYAtjnx-yjHAALWDEL2V-8FbwXb3zxY2tl.2Pd0K > 
 <input type=hidden name=VERSION value=72.0> 
 <input type=hidden name=PAYMENTREQUEST_0_PAYMENTACTION 
 value=Sale> 
 <input name=PAYMENTREQUEST_0_AMT value=19.95> 
 <input type=hidden name=RETURNURL 
 value=https://www.YourReturnURL.com> 
 <input type=hidden name=CANCELURL 
 value=https://www.YourCancelURL.com> 
 <input type=submit name=METHOD value=SetExpressCheckout> 
 </form>
 
  </div>
</body>
</html>