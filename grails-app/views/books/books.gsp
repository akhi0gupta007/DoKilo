<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="product"/>
    <title>Books</title>
    <script type="text/javascript" src="/codebee/js/jquery-1.5.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#adding').hide();
            var userid = "${session.user?.id}";

            $('#details').hide();
            $('#qq').hide();
            $("#sub_category").append('<option value=0>Create New Catogory Instead</option>');
            $("#sub_category").append('<option value=0>--------</option>');

            makeComboBox(userid,"customCollection","sub_category");
            makeTypeBox(userid,"protype");

            $("#protype").append('<option value=0>Create New Type Instead</option>');
            $("#protype").append('<option value=0>--------</option>');

            makeVendorBox(userid,"sub_ven");

            $("#sub_ven").append('<option value=0>Create New Vendor Instead</option>');
            $("#sub_ven").append('<option value=0>--------</option>');
        });
    </script>
    <script type="text/javascript" src="/codebee/js/script.js"></script>
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
    .button {
        border-top: 1px solid #96d1f8;
        background: #65a9d7;
        background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#65a9d7));
        background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
        background: -moz-linear-gradient(top, #3e779d, #65a9d7);
        background: -ms-linear-gradient(top, #3e779d, #65a9d7);
        background: -o-linear-gradient(top, #3e779d, #65a9d7);
        padding: 5px 10px;
        -webkit-border-radius: 8px;
        -moz-border-radius: 8px;
        border-radius: 8px;
        -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
        -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
        box-shadow: rgba(0,0,0,1) 0 1px 0;
        text-shadow: rgba(0,0,0,.4) 0 1px 0;
        color: white;
        font-size: 14px;
        font-family: Georgia, serif;
        text-decoration: none;
        vertical-align: middle;
    }
    .button:hover {
        border-top-color: #28597a;
        background: #28597a;
        color: #ccc;
    }
    .button:active {
        border-top-color: #1b435e;
        background: #1b435e;
    }
    a {
        text-decoration: none;
    }
    </style>
</head>
<body class="body">
<div align="right" style="float: right;margin-left: 20px">
    <g:if test="${display.data != null}">

        <img src="<g:createLink controller='books' action='renderImage' id='${display.isbn}'/>
        "/>
    </g:if>
</div>

<div align="left">

    <h3>${display.name}</h3>  by <b>${display.author}  </b>   <br>  <p>
    <em>${display.description.substring(0,display.description.length()-10)}</em>
</div>



</p>
<div align="right">
  <a href="#adding"> <input type="button" value="Add To Inventory" id="add" class="button"/></a>
</div>
<div>
     Book Details in Summary:  <br> <br>
  <table cellpadding="3">
    <tr>
        <td>ISBN</td><td>${display.isbn}</td>

    </tr>
    <tr>
        <td>ISBN13</td><td>${display.isbn13}</td>

    </tr>
    <tr>
        <td>Title</td><td>${display.name}</td>

    </tr>
    <tr>
        <td>Author</td><td>${display.author}</td>

    </tr>
    <tr>
        <td>Binding</td><td>${display.binding}</td>

    </tr>
    <tr>
        <td>Dimension</td><td>${display.dimensions}</td>

    </tr>
    <tr>
        <td>Number of Pages</td>  <td>${display.no_of_pages}</td>
    </tr>
    <tr>
        <td>Language</td><td>${display.language}</td>
    </tr>
    <tr>
        <td>Edition</td><td>${display.edition}</td>
    </tr>
      <tr>
          <td>Listed Price</td><td>${display.mp}</td>
      </tr>
  </table>
<script type="text/javascript">
    $('#add').click(function(event){
        $('#adding').show();
      //  $('#adding').focus();
        //alert('hurts');
    });
</script>
  </div>
<br><br>
  <div id="adding">
      Add This to your Inventory
      <table>
      <form action="/codebee/books/booksAdd" id="proform" method="post" enctype="multipart/form-data">
          <tr><td><label>
              Product ID
              <span class="required-indicator">*</span>
          </label></td>
          <td><input type="text" id="proid" name="pro_id"/></td></tr>
          <tr>
              <td>
                  Select Product Catogory:
              </td>


              <td>
                  <select id="sub_category" onChange="function2(this)">
                      <option value="0">-- Select Your Catogory --</option>
                  </select>

              </td><td>
              <span id="fooBar1">&nbsp;</span>
          </td>
          </tr>
          <tr>
              <td>
                  Select Product Type :
              </td>


              <td>
                  <select id="protype" onChange="function1(this)">
                      <option value="0">-- Select Your Type --</option>
                  </select>   </td><td>
              <span id="fooBar">&nbsp;</span></td>
          </tr>
      </tr>
          <tr>
              <td>Track Stock Level: <input type="checkbox" id="qu" onchange="quantity(this)"></td><td><span id="qq">Specify Quantity:</span></td>
          </tr>
          <tr>
          <tr>
          <td>
              <INPUT TYPE="checkbox" id="tax" value="payTax">
              Charge Tax
          </td>
          </tr>
          <tr>
              <td>
                  <label>
                      Selling Price
                  </label>
                  </td><td> <input type="text" id="sp" value="0.0" size="5" name="sel_price"/>INR</td>

          </tr>
          <tr>
              <td>Tags (Use comma (,) as a delimiter for Multiple values)</td>
              <td><input type="text" name="tag" size="25"></td>
          </tr>
          <input name="coll" type="hidden" id="collc" value="">
          <input name="ptype" type="hidden" id="ptc" value="">
          <input name="tax" type="hidden" id="tc" value="">
          <input name="quan" type="hidden" id="un" value="">
          <input name="title" type="hidden" value="${display.name}">
          <input name="author" type="hidden" value="${display.author}">
          <input name="description" type="hidden" value="${display.description}">
          <input name="isbn" type="hidden" value="${display.isbn}">
          <input name="isbn13" type="hidden" value="${display.isbn13}">
          <input name="binding" type="hidden" value="${display.binding}">
          <input name="pub_date" type="hidden" value="${display.pub_date}">
          <input name="publisher" type="hidden" value="${display.publisher}">
          <input name="no_of_pages" type="hidden" value="${display.no_of_pages}">
          <input name="language" type="hidden" value="${display.language}">
          <input name="edition" type="hidden" value="${display.edition}">
          <input name="weight" type="hidden" value="${display.weight}">
          <input name="data" type="hidden" value="${display.data}">
         <tr>
             <td><input type="button" value="Create" id="yahoo"/></td>
         </tr>

      </form>
      <script type="text/javascript" src="/codebee/js/script.js"></script>
      </table>
  </div>

</body>
</html>