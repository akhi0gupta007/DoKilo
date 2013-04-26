<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="product"/>
<title>Cat ${demo.name}</title>
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
</head>
<body>
  <div class="body">
  <h1 style="margin-left:20px;">${demo.name}</h1>

      <g:if test="${flash.message}">
          <div class="message" style="background: #0080FF; color: white;font-size: 1.3em;"><em>${flash.message}</em></div>
      </g:if>
 <g:if test="${arr}">
     <em>Products currently in this Category&nbsp;<g:link action="edit"  id="${demo.id}">Edit</g:link> <g:link action="ajaxDelete" id="${demo.id}">
         |Delete this Category  <img src="${request.contextPath}/images/delete.png" alt="">
     </g:link></em> <hr>

     <ol>
         <g:each var="next" in="${my}" status="i">
             <li> ${next.title}
         </g:each>
     </ol><br>
     <g:if test="${arr}">
         <g:form action="put">

             <g:hiddenField name="id" value="${params.id}" />
             <input type="submit" value="Add to Collection" id="temp"  style="background-color: #C0C292; border: solid #797C45 1px;">
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
                     <td><input type="checkbox" value="${next.id}" name="deleted"/> </td>
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

                     </tr>
                     <g:set var="counter" value="${counter + 1}" />
                 </g:each>
             </table>
         </g:form>
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


         <g:link action="showp" params="[page:pg]" id="${params.id}" >    Next </g:link>
         &nbsp;  <g:link action="showp" params="[page:back]" id="${params.id}" >< Prev</g:link>


     <br>  <br>
     Remove Products from this collection:
     <g:form action="remove" >
         <g:select optionKey="id" optionValue="title" name="coll" from="${my}" />
         <g:submitButton name="register" value="Remove"/><g:hiddenField name="id" value="${params.id}" />
     </g:form>
 </g:if>


      <br>

    <br>
    </g:if>
      <g:else>
          <h2 style="margin-left:20px;">Oops, No Product Added yet,<g:link action="showing" controller="product"> Create One</g:link></h2>
      </g:else>
    <g:if test="${entries}">
        <h3>Sub Categories for this Category</h3>
        <g:each var="next" in="${entries}">
            <li><g:link action="showp" id="${next.id}">${next.name}</g:link> </li>

        </g:each>
    </g:if>

      <br>
      <g:link action="createc" id="${params.id}">Create Child</g:link>
 <g:link action="showc" >|Back</g:link><br><br>
  </div>
</body>
</html>