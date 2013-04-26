<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="site"/>
<title>
    <g:if test="${storeName}">
      ${storeName}
    </g:if>
    <g:else>
        Undefined
    </g:else>

</title>

    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-ui-1.8.9.custom.min.js" />"></script>

    <script type="text/javascript" src="<g:resource dir="js" file="script1.js" />"></script>
    <script src="${request.contextPath}/js/overlay.js"></script>

    <script type="text/javascript">
    var total_items = 0;
    var total_price = 0;
    $(document).ready(function() {

        $("img[rel]").overlay();
        path = "${request.contextPath}"
  //  $('#box').hide();
    $(".item").draggable({
    revert: true
    });
    $("#cart_items").draggable({
    axis: "x"
    });

    $("#cart_items").droppable({
    accept: ".item",
    activeClass: "drop-active",
    hoverClass: "drop-hover",
    drop: function(event, ui) {
    var item = ui.draggable.html();
    var itemid = ui.draggable.attr("id");
    var html = '<div class="item icart">';
html = html + '<div class="divrm">';
html = html + '<a onclick="remove(this)" class="remove '+itemid+'">&times;</a>';
html = html + '<div/>'+item+'</div>';
$("#cart_items").append(html);

// update total items
total_items++;
$("#citem").html(total_items);

// update total price
var price = parseInt(ui.draggable.find(".price").html().replace("Rs ", ""));
total_price = total_price + price;
$("#cprice").html("Rs " + total_price);

// expand cart items
if (total_items > 4) {
$("#cart_items").animate({width: "+=90"}, 'slow');
}
}
});


$("#btn_next").click(function() {
$("#cart_items").animate({left: "-=100"}, 100);
return false;
});
$("#btn_prev").click(function() {
$("#cart_items").animate({left: "+=100"}, 100);
return false;
});
$("#btn_clear").click(function() {
$("#cart_items").fadeOut("2000", function() {
$(this).html("").fadeIn("fast").css({left: 0});
});
$("#citem").html("0");
$("#cprice").html("Rs 0");
total_items = 0;
total_price = 0;
return false;
});
});
function remove(el) {
$(el).hide();
$(el).parent().parent().effect("highlight", {color: "#ff0000"}, 1000);
$(el).parent().parent().fadeOut('1000');
setTimeout(function() {
$(el).parent().parent().remove();
// collapse cart items
if (total_items > 3) {
$("#cart_items").animate({width: "-=90"}, 'slow');
}
}, 1100);

// update total item
total_items--;
$("#citem").html(total_items);

// update totl price
var price = parseInt($(el).parent().parent().find(".price").html().replace("Rs ", ""));
total_price = total_price - price;
$("#cprice").html("Rs " + total_price);
}
</script>
</head>
<body style="background-color: #E643DB;">
 <div class="body">

  <!--

	<g:set var="counter" value="${0}" />	
<table id="my" cellspacing=0 cellpadding=2 >
	<g:each var="next" in="${products}">
		<g:if test="${counter == 0}">
	     	<tr><td>
		</g:if>
		<g:else>
			<g:if test="${counter % 3 == 0}">
			<tr><td>
			</g:if>
			<g:else>
			<td>
			</g:else>	
		</g:else>
		
		<table cellpadding="5">
		<tr>
		<td>${next.title}</td>
		</tr>
		<tr>
		<td> <img src="${next.image}" width="200" height="100"/>
		</tr>
		<tr>
		<td><em>${next.description}</em></td>
		</tr>
		<tr><td>Only At Rs. ${next.sel_price} </td></tr>
		</table>
		
	
		<g:if test="${counter == 0}">
	     		</td>
		</g:if>
		<g:else>
			<g:if test="${counter % 3 == 0}">
			</td>
			</g:if>
			<g:else>
			</td>
			</g:else>	
		</g:else>
	 <g:set var="counter" value="${counter + 1}" />
	</g:each>
</table>
     -->


     <h3>Featured Products</h3>

     <g:each var="next" in="${featured}">

         <div class="item" id="i1">
             <img src="<g:resource dir="images/products" file="${next.image}"/>" width="100" height="100"/>
             <label class="title" id="${next.id}">${next.title}</label>
             <label class="price">Rs ${next.sel_price}</label>

         </div>

     </g:each>

<div id="item_container">

    <g:if test="${flash.message}">
        <div class="message" style="background: #ff275b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>
     <br>   <br> <br>
    <g:each var="next" in="${products}">

        <div class="item" id="i1">
        <g:link action="details" id="${next.id}">
            <g:if env="production">
                <img src="/images/products/${next.image}" alt="image" width="100" height="100"/>
            </g:if>
            <g:else>
                <img src="<g:resource dir="images/products" file="${next.image}"/>" width="100" height="100"/>
            </g:else>

            <label class="title" id="${next.id}">${next.title}</label>
            <label class="price">Rs ${next.sel_price}</label>
            </g:link>
        </div>

    </g:each>
    <div class="clear"></div>
</div>



     <div class="simple_overlay" id="mies1">
         <!-- large image -->

         <div class="cart">
             <h2 align="center">Shopping Cart</h2>
             <br> <br>
             <form action="${request.contextPath}/sales/review" method="post" id="review">
                 <table id="cart">



                 </table>
                 <br><br>
                 <a href='javascript:void(0)' class="classname" id='order' onclick="order()">Place Order</a>
             </form>

             <script type="text/javascript">
                 function order(){
                     $('#review').submit();
                 }
             </script>
         </div>


     </div>

  </div>


</body>
</html>
