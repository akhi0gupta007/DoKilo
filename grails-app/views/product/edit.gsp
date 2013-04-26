<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            document.getElementById("area").value = "${product.description}";
        });
    </script>
    <style type="text/css">
    table {
        font: 11px/24px Verdana, Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 400px;
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
    .bold{
        font-weight: bold;
    }
    </style>
    <title>
        ${product.title}</title>




</head>
<body>

<div class="body">

    <h2 align="center">${product.title}</h2>
    <h4 align="center"><em>Edit And Save </em></h4>

    <g:uploadForm action="change">
    <table style="float: left;">
        <tr>
            <td class="bold">Title</td>
            <td><input type="text" name="title" value="${product.title}"></td>
        </tr>
        <g:if test="${tags}">
            <tr>
                <td class="bold">
                    Tags
                </td>
                <td >
                    <g:each in="${tags}" var="next">
                      <input type="text" name="tags" value="${next.name}">
                    </g:each>
                </td>
            </tr>
        </g:if>
        <tr>
            <td class="bold">
                Description:
            </td>
            <td>
              <textarea rows="2" cols="35" id="area" name="description"></textarea>
            </td>
            <td>

            </td>
            <td>
                <g:if test="${product instanceof com.codebee.products.Books}">
                    <img src="<g:createLink controller='books' action='renderImage' id='${product.isbn}'/>
                    "/>
                </g:if>
                <g:else>
                    <g:if env="production">
                        <img src="/images/products/${product.image}" alt="image" width="150" height="150"/>
                    </g:if>
                    <g:else>
                        <img src="<g:resource dir="images/products" file="${product.image}"/>" width="150" height="150"/>
                    </g:else>
                </g:else>
            </td>
        </tr>
        <g:if test="${product instanceof com.codebee.products.Books}">
            <tr>
                <td class="bold">Vendor:</td>
                <td><input type="text" value="${product?.publisher}" name="publisher"></td>
            </tr>
        </g:if>
        <g:else>
            <tr>
                <td class="bold">Vendor:</td>
                <td><input value="${product?.vendor.ven_name}" name="vendor" type="text"></td>
            </tr>
        </g:else>

        <tr>
            <td class="bold">
                Selling Price:
            </td>
            <td>
               Rs. <input type="text" value="${product?.sel_price}" size="4" name="sel_price"/>
            </td>

        </tr>
        <tr>
            <td class="bold">
                Weight:
            </td>
            <td>
                <input type="text" value= "${product?.weight}" size="3" name="weight"/>
            </td>
        </tr>
        <tr>
            <td class="bold">
                Dimensions:
            </td>
            <td>
                <input type="text" value="${product?.dimen}" name="dimen"/>
            </td>
            <td class="bold">Change Image</td>
            <td><input type="file" name="photo"/></td>
        </tr>
        <tr>
            <td class="bold">
                In Stock:
            </td>
            <td>
                <input type="text" value="${product?.quan}" name="quan"/>
            </td>
        </tr>
        <tr>
            <td class="bold">
                Tax Applicable:
            </td>
            <td>
              <input type="text" value="${product?.tax}" name="tax"/>
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
        <g:if test="${product.proTemplates != null && product.proTemplates.flag == 'Y'}">

            <g:each in="${list}" var="next">
                <tr>
                    <td class="bold">${next.name}</td>
                    <td class="bold"><input type="text" name="custom" value="${next.value}"></td>
                </tr>
            </g:each>
        </g:if>
        <tr>
            <td><input type="hidden" value="${product.id}" name="id"><input type="submit" value="Save"></td>
        </tr>
    </table>

    </g:uploadForm>
</div>
</body>
</html>