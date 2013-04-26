<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>
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

    <h2 align="center">${product.title}</h2> <br>
    <h4 align="center"><em><g:link action="edit" id="${product.id}">Edit</g:link> </em></h4>
    <div id="image"  style="float:right;">
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
    </div>
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
</body>
</html>