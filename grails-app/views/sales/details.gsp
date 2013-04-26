<%@ page import="com.codebee.sales.SalesController" contentType="text/html;charset=UTF-8" %>
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
    <style type="text/css">

    table {
        font: 11px/24px Verdana, Arial, Helvetica, sans-serif;

        width: 100%;
    }

    th {
        padding: 0 0.5em;
        text-align: left;
    }

    tr.yellow td {

        background: #FFC;
    }

    td {

        padding: 0 0.5em;
    }

    td.width {
        width: 100%;
    }

    td.adjacent {

        text-align: center;
    }

        /* the overlayed element */
    .simple_overlay {

        /* must be initially hidden */
        display:none;

        /* place overlay on top of other elements */
        z-index:10000;

        /* styling */
        background-color: #ffffff;

        width:675px;
        min-height:500px;
        border:1px solid #666;

        /* CSS3 styling for latest browsers */
        -moz-box-shadow:0 0 90px 5px #000;
        -webkit-box-shadow: 0 0 90px #000;
    }

        /* close button positioned on upper right corner */
    .simple_overlay .close {
        background-image:url(${request.contextPath}/images/close.png);
        position:absolute;
        right:-15px;
        top:-15px;
        cursor:pointer;
        height:35px;
        width:35px;
    }
        /* styling for elements inside overlay */
    .cart {

        top:15px;
        padding: 20px;
        font-size:11px;
        color: #331921;
        margin-left:auto;
        margin-right:auto;

    }

    .cart p{
        border-color: blue;
        border-width: thin;
        border-style: dashed;
    }

    .cart h2 {
        color: #4f574f;
        font-size:20px;


    }
    .cart table{
       border: 1px;
    }
    .cart td{
        text-align: center;
        padding:5px;
    }
    .cart th{
        font-weight: bold;
        background-color: #9dafb8;
    }
    .cart items {


        }

    </style>

    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-ui-1.8.9.custom.min.js" />"></script>
    <script type="text/javascript" src="<g:resource dir="js" file="script1.js" />"></script>
    <script src="${request.contextPath}/js/overlay.js"></script>
    <script type="text/javascript">
        $(document).ready(function()
        {
                     $("img[rel]").overlay();
            path = "${request.contextPath}"
        });

    </script>
</head>
<body style="background-color: #E643DB;">
<div class="body">
    <h2 align="center">${product.title}</h2> <br>

    <div id="image"  style="float:right;">
        <g:if test="${flash.message}">
            <div class="message" style="background: #ff275b; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
        </g:if>
        <g:if test="${product instanceof com.codebee.products.Books}">
            <img src="<g:createLink controller='books' action='renderImage' id='${product.isbn}'/>
            "/>
        </g:if>
        <g:else>
            <g:if env="production">
                <img src="/images/products/${product.image}" alt="image" width="230" height="220"/>
            </g:if>
            <g:else>
                <img src="<g:resource dir="images/products" file="${product.image}"/>" width="230" height="220"/>
            </g:else>
        </g:else>

     <br>   <br><br>
        <g:remoteLink action="remoteCart" onSuccess="addedCart()" id="${product.id}">
            <img src="<g:resource dir="images" file="cart.gif"/> " rel="#mies1"/>
        </g:remoteLink>

    </div>

    <div style="float: left">
        <table style="float: left;">
            <tr>
                <td class="bold">
                    Description:
                </td>
                <td>
                    ${product?.description}
                </td>

            </tr>
            <g:if test="${tags}">
                <tr>
                    <td class="bold">
                        Tags
                    </td>
                    <td >
                        <g:each in="${tags}" var="next">
                            <span style="background-color: #00CDCD; border: solid #797C45 1px;padding: 2px;padding-left: 4px;padding-right: 4px;">${next.name}</span>
                        </g:each>
                    </td>
                </tr>
            </g:if>
            <g:if test="${product instanceof com.codebee.products.Books}">
                <tr>
                    <td class="bold">Vendor:</td>
                    <td>${product?.publisher}</td>
                </tr>
            </g:if>
            <g:else>
                <g:if test="${product.vendor}">
                    <tr>
                        <td class="bold">Vendor:</td>
                        <td>${product?.vendor.ven_name}</td>
                    </tr>
                </g:if>

            </g:else>

            <tr>
                <td class="bold">
                    Selling Price:
                </td>
                <td>
                    ${product?.sel_price}
                </td>

            </tr>
            <tr>
                <td class="bold">
                    Weight:
                </td>
                <td>
                    ${product?.weight}
                </td>
            </tr>
            <tr>
                <td class="bold">
                    Dimensions:
                </td>
                <td>
                    ${product?.dimen}
                </td>
            </tr>
            <tr>
                <td class="bold">
                    In Stock:
                </td>
                <td>
                    ${product?.quan}
                </td>
            </tr>
            <tr>
                <td class="bold">
                    Tax Applicable:
                </td>
                <td>
                    <%= product.tax %>

                </td>

            </tr>
            <tr>
                <td class="bold">
                    Added On :
                </td>
                <td>
                    ${product.dateCreated}
                </td>

            </tr>
            <tr>
                <td class="bold">Present in the Collection</td>
                <g:each var="next" in="${collection}">
                    <td>${next.name}</td>
                </g:each>

            </tr>
            <g:if test="${product.variants != null}">

                <tr>
                    <td>Other Info</td>
                </tr>
                <tr>
                    <td class="bold">
                        Color:
                    </td>
                    <td>
                        ${product.variants?.color}
                    </td>
                </tr>
                <tr>
                    <td class="bold">
                        Style:
                    </td>
                    <td>
                        ${product.variants?.style}
                    </td>
                </tr>
                <tr>
                    <td class="bold">
                        Size:
                    </td>
                    <td>
                        ${product.variants?.size}
                    </td>
                </tr>
                <tr>
                    <td class="bold">
                        Material:
                    </td>
                    <td>
                        ${product.variants?.mat}
                    </td>
                </tr>
                <g:if test="${product.proTemplates != null && product.proTemplates.flag == 'Y'}">

                    <g:each in="${product.proTemplates.nameValuePair}" var="next">
                        <tr>
                            <td class="bold">${next.name}</td>
                            <td class="bold">${next.value}</td>
                        </tr>
                    </g:each>
                </g:if>
                <g:if test="${product.variants.customVariant != null}">
                    <tr>
                        <td>Custom Attributes:</td>
                    </tr>
                    <g:each in="${product.variants.customVariant}" var="next">
                        <tr>
                            <td class="bold">
                                ${next.name}:
                            </td>
                            <td>
                                ${next.value}
                            </td>
                        </tr>
                    </g:each>
                </g:if>
            </g:if>

        </table>
    </div>

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
