<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>
    <title>Products</title>

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

    <script type="text/javascript" src="/codebee/js/jquery-1.5.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#isbn').hide();
        });
    </script>
</head>
<body class="body">
<div id="list">
    <ul>
        <li><a href="#" id="books">Books</a></li>
    </ul>
</div>
<div id="isbn">
    <table id="protype1" name="protype1" cellpadding="5" cellspacing="4">
        <tr><th>Select</th><th>Product ID </th>
            <th>Book Title </th><th>Author</th><th>Publisher</th><th>Sell Price</th><th>Description</th>
            <th>ISBN</th></tr>
        <g:each var="next" in="${arr}">
            <g:if test="${next instanceof com.codebee.products.Books}">
                <tr>
                    <td><input type="checkbox" value="${next.id}"/> </td>
                    <td>${next.id}</td>
                    <td>${next.title}</td>
                    <td>${next.author}</td>
                    <td>${next.publisher}</td>
                    <td>${next.sel_price}</td>
                    <td>${next.description.substring(0,80)}</td>
                    <td>${next.isbn}</td>
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
                </g:if>

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




</div>
<script type="text/javascript">
    $('#books').click(function(event){
        event.preventDefault();
        $('#list').hide();
        $('#isbn').show();
        // console.log("ahahhh");
    });
</script>
</body>
</html>