<%
    def cart = []
    %>
    <div id="navigate">
        <div id="nav_left">
            <a href="" id="btn_prev"><</a>
            <a href="" id="btn_next">></a>
            <a href="" id="btn_clear">Clear Cart</a>
        </div>
        <div id="nav_right">
            <span class="sptext">
                <label>Items </label><label class="count" id="citem">0</label>
            </span>

            <span class="sptext">
                <label>Price </label><label class="count" id="cprice">Rs 0</label>
            </span>
            <span class="sptext">
                <label id="activator" >CheckOut </label>
            </span>
        </div>
        <div class="clear"></div>
    </div>
    <div style="clear:both;"></div>

    <div id="cart_toolbar">
        <div id="cart_items" class="back"></div>
    </div>

     <form action="/codebee/sales/checkout" id="chk">
         <input type="hidden" id="items" value="" name="x"/>
     </form>

    <script type="text/javascript">
        var ex = 0;
        var xy  = new Array();
                $('#activator').click(function(){
                var kids = $('#cart_items').children();
                var url = "/codebee/sales/checkout"

            //    $('#box2').html(geturl('/codebee/sales/checkout'));

                $.each(kids,function(key,value){
                    xy.push($(value).find(".title").attr("id"));
                               });
                   console.log(xy);
                    $('#items').attr('value',xy.toString());
                  //  $.post("/codebee/sales/checkout", {x:xy.toString()},"json");
                    $('#chk').submit();

                //   $(location).attr('href',url);
            });



    </script>

