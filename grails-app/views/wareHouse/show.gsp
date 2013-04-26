
<%@ page import="com.codebee.products.Product; com.codebee.logistics.WareHouse" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="logistics">
		<g:set var="entityName" value="${message(code: 'wareHouse.label', default: 'WareHouse')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <script src="/codebee/js/jquery-1.5.min.js"></script>
        <script src="/codebee/js/overlay.js"></script>
        <script type="text/javascript">
            $(document).ready(function()
            {
                //for table row
                $("tr:even").css("background-color", "#F4F4F8");
                $("tr:odd").css("background-color", "#FFFFFF");
                $("img[rel]").overlay();
            });

        </script>
        <style type="text/css">
            /* the overlayed element */
        .simple_overlay {

            /* must be initially hidden */
            display:none;

            /* place overlay on top of other elements */
            z-index:10000;

            /* styling */
            background-color: #b7b4de;

            width:675px;
            min-height:200px;
            border:1px solid #666;

            /* CSS3 styling for latest browsers */
            -moz-box-shadow:0 0 90px 5px #000;
            -webkit-box-shadow: 0 0 90px #000;
        }
        .products{

            font-size:13px;
            color:#fff;
            width:100%;
            padding-left: 5px;
        }
            /* close button positioned on upper right corner */
        .simple_overlay .close {
            background-image:url(/codebee/images/close.png);
            position:absolute;
            right:-15px;
            top:-15px;
            cursor:pointer;
            height:35px;
            width:35px;
        }
            /* styling for elements inside overlay */
        .details {
            position:absolute;
            top:15px;
            right:15px;
            font-size:11px;
            color:#fff;
            width:150px;
        }

        .details h3 {
            color:#aba;
            font-size:15px;
        }
        table {
            font: 11px/24px Verdana, Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
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
            width: 100%;
        }

        td.adjacent {
            border-left: 1px solid #CCC;
            text-align: center;
        }
        </style>
	</head>
	<body>

    <h2>${wareHouseInstance.name}</h2>
    <address>${wareHouseInstance.location}</address>

    <g:if test="${arr}">
        <g:set var="counter" value="${0}" />
        <br>   <br>
        <table id="protype1" name="protype1" cellpadding="5" cellspacing="4">
            <tr><th>Select</th><th>Product ID </th>
                <th>Product Title </th><th>Sell Price</th>
                <th>Vendor</th><th>No. of Units</th></tr>
            <g:each var="next" in="${arr}">
                <g:if test="${counter % 2 == 0}">
                    <tr class="even">
                </g:if>
                <g:else>
                    <tr class="odd">
                </g:else>
                <td><input type="checkbox" value="${next.id}"/> </td>
                <td>${next.id}</td>
                <td><g:link action="details" controller="product" id="${next.id}" > ${next.title}</g:link></td>
                <td>${next.sel_price}</td>

                <td>${next.vendor?.ven_name}</td>
                <td>${next?.quan}</td>
                <!--
                <g:if test="${next instanceof com.codebee.products.Books}">
                    <td>${next?.isbn}</td>
                </g:if>
                -->
                <td>
                    <img src="/codebee/images/ware.PNG" rel="#mies1" onclick="hello('${next.id}')" />

                </td>
                </tr>
                <g:set var="counter" value="${counter + 1}" />
            </g:each>
        </table>
        <br>
        <g:set var="pg"/>

        <%
            if(request.getParameter("page") != null){
                pg = Integer.parseInt(request.getParameter("page"));
                pg = pg +4
            }
        %>


        <g:link action="show" params="[page:pg]" id="${params.id}" >    Next </g:link>
        <!--
        <img src="thumbs/barcelona-pavilion.jpg" rel="#mies1" onclick="hello('${params.id}')" />
        <img src="thumbs/barcelona-pavilion2.jpg" rel="#mies2"/>
        -->
        <!-- first overlay. id attribute matches our selector -->
        <div class="simple_overlay" id="mies1">
            <!-- large image -->
            <div id="product" class="products">

            </div>


        </div>

        <!-- second overlay -->
        <div class="simple_overlay" id="mies2">
            <img src="photos/barcelona-pavilion-large.jpg" />

            <!-- image details -->

        </div> ...
        </div>


    </g:if>
     <script type="text/javascript" src="/codebee/js/script.js"></script>
     <script type="text/javascript">
         function hello(x){

                fetchProduct(x)
            //   $('#product').html("Product : ");
         }
     </script>

	</body>
</html>
