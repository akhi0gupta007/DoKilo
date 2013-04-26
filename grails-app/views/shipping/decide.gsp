<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="logistics"/>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <title>Logistics</title>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#wtb').hide();
            $('#pb').hide();
        });
    </script>
</head>
<body>
<div class="body">
    <div class="header">
      <a href="#" id="wt">Add Weight Based Plan</a>  | <a href="#" id="pr">Add Price based Plan    </a>
    </div>
    <br>
    <div id="wtb">
        <form action="add">
            <table>
             <tr>
                 <td>Plan Name:</td>
                 <td><input type="text" name="plan"></td>
             </tr>
               <tr>
                   <td>From Weight:</td><td><input type="text" name="lo_wt" size="3"/></td>
                   <td>To Weight:</td><td><input type="text" name="up_wt" size="3"/></td>

               </tr>
                <tr>
                    <td>Define Price:</td> <td><input type="text" name="price" size="3"/>     </td>

>             </tr>
                <tr>
                    <td><input type="submit" value="Add Plan"></td>  <input type="hidden" name="wt_based" value="true"/>
                </tr>
            </table>
         </form>
        </div>
            <div id="pb">

                <form action="add">
                    <table>
                        <tr>
                            <td>Plan Name:</td>
                            <td><input type="text" name="plan"></td>
                        </tr>
                        <tr>
                            <td>From Price:</td><td><input type="text" name="lo_price" size="3"/></td>
                            <td>To Price:</td><td><input type="text" name="up_price" size="3"/></td>

                        </tr>
                        <tr>
                            <td>Define Price:</td> <td><input type="text" name="price" size="3"/>     </td>

                                         </tr>
                        <tr>
                            <td><input type="submit" value="Add Plan"></td>
                        </tr>
                    </table>


        </form>
    </div>
       <script type="text/javascript">
           $('#wt').click(function(event){
            event.preventDefault();
               $('#wtb').show();
               $('#pb').hide()
           });
           $('#pr').click(function(event){
               event.preventDefault();
               $('#wtb').hide();
               $('#pb').show()
           });
       </script>
</div>
</body>
</html>