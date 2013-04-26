<%--
  Created by IntelliJ IDEA.
  User: akhilesh
  Date: 3/22/12
  Time: 5:57 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="site"/>
    <script type="text/javascript" src="/codebee/js/jquery-1.5.min.js"></script>
    <script type="text/javascript" src="/codebee/js/jquery-ui-1.8.9.custom.min.js"></script>
  <title>Cart</title>
  
<script type="text/javascript">
    var total_items = 0;
    var total_price = 0;
    $(document).ready(function() {

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
                var price = parseInt(ui.draggable.find(".price").html().replace("$ ", ""));
                total_price = total_price + price;
                $("#cprice").html("$ " + total_price);

                // expand cart items
                if (total_items > 4) {
                    $("#cart_items").animate({width: "+=120"}, 'slow');
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
            $("#cprice").html("$ 0");
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
                $("#cart_items").animate({width: "-=120"}, 'slow');
            }
        }, 1100);

        // update total item
        total_items--;
        $("#citem").html(total_items);

        // update totl price
        var price = parseInt($(el).parent().parent().find(".price").html().replace("$ ", ""));
        total_price = total_price - price;
        $("#cprice").html("$ " + total_price);
    }
</script>
</head>
<body>



<div id="item_container">
    <div class="item" id="i1">
        <img src="img/1.jpg"/>
        <label class="title" id="26">T-Shirt 1</label>
        <label class="price">$ 20</label>
    </div>
    <div class="item" id="i2">
        <img src="img/2.jpg"/>
        <label class="title" id="25">T-Shirt 2</label>
        <label class="price">$ 24</label>
    </div>
    <div class="item" id="i3">
        <img src="img/3.jpg"/>
        <label class="title">T-Shirt 3</label>
        <label class="price">$ 18</label>
    </div>
    <div class="item" id="i4">
        <img src="img/4.jpg"/>
        <label class="title">T-Shirt 4</label>
        <label class="price">$ 30</label>
    </div>
    <div class="item" id="i5">
        <img src="img/5.jpg"/>
        <label class="title">T-Shirt 5</label>
        <label class="price">$ 28</label>
    </div>
    <div class="item" id="i6">
        <img src="img/6.jpg"/>
        <label class="title">T-Shirt 6</label>
        <label class="price">$ 26</label>
    </div>
    <div class="item" id="i7">
        <img src="img/7.jpg"/>
        <label class="title">T-Shirt 7</label>
        <label class="price">$ 35</label>
    </div>
    <div class="item" id="i8">
        <img src="img/8.jpg"/>
        <label class="title">T-Shirt 8</label>
        <label class="price">$ 33</label>
    </div>
    <div class="item" id="i9">
        <img src="img/9.jpg"/>
        <label class="title">T-Shirt 111</label>
        <label class="price">$ 12</label>
    </div>
    <div class="item" id="i10">
        <img src="img/10.jpg"/>
        <label class="title">T-Shirt 10</label>
        <label class="price">$ 22</label>
    </div>
    <div class="clear"></div>
</div>



</div>
</body>
</html>
