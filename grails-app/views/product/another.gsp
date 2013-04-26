<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>
    <title>Showing List</title>

   <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script type="text/javascript" src="<g:resource dir="js" file="menu.js" />"></script>


    <style type="text/css">
    body {
        font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
        color: #4f6b72;
        background: #E6EAE9;
    }



    #protype1 {
        width: 800px;
        padding: 0;
        margin: 0;
    }

    caption {
        padding: 0 0 5px 0;
        width: 900px;
        font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
        text-align: right;
    }

    th {
        font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
        color: #4f6b72;
        border-right: 1px solid #C1DAD7;
        border-bottom: 1px solid #C1DAD7;
        border-top: 1px solid #C1DAD7;
        letter-spacing: 2px;
        text-transform: uppercase;
        text-align: left;
        padding: 6px 6px 6px 12px;
        background: #CAE8EA url(${request.contextPath}/images/bullet1.gif) no-repeat;
    }

    th.nobg {
        border-top: 0;
        border-left: 0;
        border-right: 1px solid #C1DAD7;
        background: none;
    }

    td {
        border-right: 1px solid #C1DAD7;
        border-bottom: 1px solid #C1DAD7;
        background: #fff;
        padding: 6px 6px 6px 12px;
        color: #4f6b72;
    }


    td.alt {
        background: #F5FAFA;
        color: #797268;
    }

    th.spec {
        border-left: 1px solid #C1DAD7;
        border-top: 0;
        background: #fff url(${request.contextPath}/images/bullet1.gif) no-repeat;
        font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
    }

    th.specalt {
        border-left: 1px solid #C1DAD7;
        border-top: 0;
        background: #f5fafa url(${request.contextPath}/images/bullet2.gif) no-repeat;
        font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
        color: #797268;
    }
    </style>

</head>

<body>

<div class="body">


    <div id="show">

        <g:if test="${flash.message}">
            <div class="message" style="background: #0080FF; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
        </g:if>
        <g:if test="${arr}">
        <g:form action="results">


            <h3>Showing Your Products </h3> Search Anything >    <g:textField name="tag" />        <g:submitButton name="search" value="Search"/>
                </g:form>

        <ul id="sddm">
            <li><a href="#"
                   onmouseover="mopen('m1')"
                   onmouseout="mclosetime()">Sort By</a>
                <div id="m1"
                     onmouseover="mcancelclosetime()"
                     onmouseout="mclosetime()">


                     <a href="another?page=0&by=id">ID</a>
                    <a href="another?page=0&by=title">Title</a>
                    <a href="another?page=0&by=dateCreated"> dateCreated</a>
                </div>
            </li>

        </ul>



        <g:set var="counter" value="${0}" />
              <br>   <br>
        <table id="protype1" name="protype1" cellpadding="5" cellspacing="4" >
            <tr><th>Select</th><th>Product ID </th>
                <th>Product Title </th><th>Sell Price</th><th>Description</th>
                <th>Vendor</th><th>Remove</th></tr>
            <g:each var="next" in="${arr}">
                <g:if test="${counter % 2 == 0}">
                    <tr class="alt">
                </g:if>
                <g:else>
                    <tr class="specalt">
                </g:else>
                    <td><input type="checkbox" value="${next.id}"/> </td>
                    <td>${next.id}</td>
                    <td><g:link action="details" id="${next.id}"> ${next.title}</g:link></td>
                    <td>${next.sel_price}</td>
                    <td>${next.description}</td>
                    <td>${next.vendor?.ven_name}</td>
                   <!--
                    <g:if test="${next instanceof com.codebee.products.Books}">
                        <td>${next?.isbn}</td>
                    </g:if>
                -->
                    <td align="center">
                      <!--  <g:remoteLink action="ajaxDelete" id="${next.id}" update="[success:'message',failure:'error']"
                                      oncomplete="bookRemoved(${next.id});"><img src="/codebee/images/delete.png" alt=""></g:remoteLink>
                -->
                        <g:link action="ajaxDelete" id="${next.id}">
                            <img src="${request.contextPath}/images/delete.png" alt="">
                        </g:link>
                    </td>
                </tr>
                <g:set var="counter" value="${counter + 1}" />
            </g:each>
        </table>
        <br>
        <g:set var="pg"/>
        <g:set var="back"/>
        <%
        if(request.getParameter("page") != null){
        pg = Integer.parseInt(request.getParameter("page"));
        back = pg-4;
        pg = pg +4
        }else{
            pg=4;
        }
         %>


            <g:link action="another" params="[page:pg]">    Next> </g:link>
          &nbsp;  <g:link action="another" params="[page:back]">< Prev</g:link>


        </g:if>
        <g:else>
            <h2>You have not created any Products, <g:link action="showing">Create Now...</g:link>    </h2>
        </g:else>
    </div>

</div>
</body>
</html>
