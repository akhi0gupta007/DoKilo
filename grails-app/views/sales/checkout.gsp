<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="blank"/>
    <title>Checkout</title>
    <style type="text/css">
    A:link {text-decoration: none;color:#736F6E;}
    A:visited {text-decoration: none;color:#736F6E;}
    A:active {text-decoration: none;color:#736F6E;}
    A:hover {text-decoration: underline; color: #736F6E;}
    <g:if test="${session.temp != null}">
    body{background-color: ${session.temp.page_bg.bgcolor};}
    </g:if>
    table {
        font: 11px/24px Verdana, Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 320px;
    }

    th {
        padding: 0 0.5em;
        text-align: left;
    }

    tr.yellow td {
        border-top: 1px solid #FB7A31;
        border-bottom: 1px solid #FB7A31;
        background: #FFC;
    }

    td {
        border-bottom: 1px solid #CCC;
        padding: 0 0.5em;
    }

    td.width {
        width: 190px;
    }

    td.adjacent {
        border-left: 1px solid #CCC;
        text-align: center;
    }

    </style>
    <script type="text/javascript" src="/codebee/js/jquery-1.5.min.js"></script>
    <script type="text/javascript" src="/codebee/js/jquery-ui-1.8.9.custom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(data){
            console.log("hello world");
           var result = $('#my').find('.give');
           var total = 0 ;
           $.each(result,function(key,value){
               var x = $(value).attr("id");
               total = total + parseFloat(x)

           });
            $('#price').html(total);
        });
        function remove(el) {
            $(el).hide();
            $(el).attr('class', 'newClass');
            $(el).parent().parent().effect("highlight", {color: "#ff0000"}, 1000);
            $(el).parent().parent().fadeOut('1000');
            $(el).parent().parent().remove();
        }
    </script>

</head>
<body style="background-color: #E643DB;">
<div class="body">
     <div id="proceed">

         <table id="my" cellspacing=5 cellpadding=10 >

             <thead style="background-color:#808080; "><th>ID</th><th>Product</th><th>Price</th><th>Delete</th></thead>
             <g:each var="next" in="${arr}">
                 <tr> <td class="take" id="${next.id}">${next.id}</td> <td>${next.title}</td>   <td class="give" id="${next.sel_price}">Rs. ${next.sel_price}</td>
                     <td><a onclick="remove(this)" class="remove '+itemid+'">&times;</a></td>
                 </tr>
             </g:each>
             <tr><td></td><td>Total : </td><td id="price"></td></tr>
         </table>

     </div>   <br>
          <input type="button" id="pur" value="Proceed To Pay">
</div>

<script type="text/javascript">


    $('#pur').click(function(){

        console.log("enter");
        var kids = $('#my').find(".take");

            $.each(kids,function(key,value){
            var x = $(value).attr("id");
            console.log(x);
        });

      //  console.log(xy);
        //$('#items').attr('value',xy.toString());
        //  $.post("/codebee/sales/checkout", {x:xy.toString()},"json");
        //$('#chk').submit();

        //   $(location).attr('href',url);
    });



</script>

</body>
</html>
