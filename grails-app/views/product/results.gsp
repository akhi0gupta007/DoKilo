<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>
    <title>Showing List</title>
    <script type="text/javascript" src="<g:resource dir="js" file="menu.js" />"></script>
    <style type="text/css">
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

    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script type="text/javascript">
        $(document).ready(function()
        {
            //for table row
            $("tr:even").css("background-color", "#F4F4F8");
            $("tr:odd").css("background-color", "#FFFFFF");

        });

    </script>
</head>

<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message" style="background: #0080FF; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
    </g:if>

    <div id="show">


        <g:form action="results">


            <h3>Showing Your Products <g:link action="explore"  params="[page:0]">(Explore Products by Templates)</g:link> </h3> Search Anything >    <g:textField name="tag" />        <g:submitButton name="search" value="Search"/>
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
                </div>
            </li>

        </ul>

       <g:if test="${arr}">
           <g:set var="counter" value="${0}" />
           <br>   <br>
           <table id="protype1" name="protype1" cellpadding="5" cellspacing="4">
               <tr><th>Select</th><th>Product ID </th>
                   <th>Product Title </th><th>Sell Price</th><th>Description</th>
                   <th>Vendor</th></tr>
               <g:each var="next" in="${arr}">
                   <g:if test="${counter % 2 == 0}">
                       <tr class="even">
                   </g:if>
                   <g:else>
                       <tr class="odd">
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
                   <td>
                       <g:remoteLink action="ajaxDelete" id="${next.id}" update="[success:'message',failure:'error']"
                                     oncomplete="bookRemoved(${next.id});">delete</g:remoteLink>
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


           <g:link action="another" params="[page:pg]">    Next </g:link>




       </g:if>
        <g:else>
          <br><br>  <h2>Sorry, Haven't found anything!</h2>
        </g:else>

    </div>

</div>

</body>
</html>