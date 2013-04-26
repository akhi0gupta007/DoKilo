var userid,token;
function check(){
$.getJSON('http://localhost:8080/codebee/persistence/index', function(data) {
	  var items = [];
	
	  $.each(data, function(key, val) {
		console.log(val);
		if(key==="userid")
			userid=val
		if(key==="token")	
			token=val
	    items.push('<li id="' + key + '">' + val + '</li>');
	 	  	});

	  $('<ul/>', {
	    'class': 'my-new-list',
	    html: items.join('')
	  }).appendTo('body');
	})
	.error(function() { alert("error"); })
	.complete(function() { checkCookie(); });
}

function getCookie(c_name)
{
var i,x,y,ARRcookies=document.cookie.split(";");
for (i=0;i<ARRcookies.length;i++)
  {
  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
  x=x.replace(/^\s+|\s+$/g,"");
  if (x==c_name)
    {
    return unescape(y);
    }
  }
}

function setCookie(c_name,value,exdays)
{
var exdate=new Date();
exdate.setDate(exdate.getDate() + exdays);
var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
document.cookie=c_name + "=" + c_value;
}

function checkCookie()
{
	console.log("Userid .."+userid+"Token.."+token);
	setCookie("userid",userid,365);
	setCookie("token",token,365);
	/*
var username=getCookie("userid");
if (username!=null && username!="")
  {
  alert("Welcome again " + username);
  }
else
  {
  username=prompt("Please enter your name:","");
  if (username!=null && username!="")
    {
    setCookie("username",username,365);
    }
  }
  */
}
