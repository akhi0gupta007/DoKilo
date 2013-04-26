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
    .bold{
        font-weight: bold;
    }
    </style>
    <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
    <script language="JavaScript" type="text/javascript" xml:space="preserve" src="<g:resource dir="js" file="gen_validatorv4.js" />"></script>

    <script type="text/javascript" src="<g:resource dir="js" file="script1.js" />"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            path = "${request.contextPath}"
            var userid = "${session.user?.id}";

            var t= getCookie("token");
            console.log(t+"and session"+"${session.token}");

            $('#details').hide();
            $('#qq').hide();
            $('#attr').hide();
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

</head>
<body class="body">
<div id="add">
              <h2 align="center">Adding for ${fields.name}</h2>
    <form action="${request.contextPath}/product/added" id="proform" method="post" enctype="multipart/form-data">

        <table cellpadding="3">
            <tr><td><label for="product">
                Product Title
                <span class="required-indicator">*</span>
            </label></td></tr>
            <tr><td><input type="text" id="proname" name="title"/><div id='titleerror' class="error_strings"></div></td></tr>
            <tr><td><label for="product">
                Product ID
                <span class="required-indicator">*</span>
            </label></td></tr>
            <tr><td><input type="text" id="proid" name="pro_id"/><div id='iderror' class="error_strings"></div></td></tr>
            <tr>
                <td>Tags (Use comma (,) as a delimiter for Multiple values)</td>
                <td><input type="text" name="tag" size="25"></td>
            </tr>
            <tr>

                    <td> Attributes for  <b> ${fields.name} </b>Category</td>

            </tr>
            <g:each in="${list}" var="next">
                <tr>
                    <td>${next.name}</td>   <td><input type="text" name="custom"></td>
                </tr>
            </g:each>




            <tr>
                <td>
                    <label>
                        Description

                    </label></tr>
            <tr><td><textarea id="description"  rows="5" cols="30" name="description"></textarea>
            </td>
            </tr>
            <tr>
                <td><u>Product Properties</u>		</td>
            </tr>
            <tr>
                <td>
                    Select Product Vendor:
                </td>
            </tr>
            <tr>
                <td>
                    <select id="sub_ven" onChange="function3(this)">
                        <option value="0">-- Select Your Vendor --</option>
                    </select>

                </td>
                <td><span id="fooBar12">&nbsp;</span></td>
            </tr>
            <tr>
                <td>
                    Select Product Catogory:
                </td>
            </tr>
            <tr>
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
            </tr>
            <tr>
                <td>
                    <select id="protype" onChange="function1(this)">
                        <option value="0">-- Select Your Type --</option>
                    </select>   </td><td>
                <span id="fooBar">&nbsp;</span></td>
            </tr>
            <tr>
                <td>
                    <label>
                        Selling Price
                    </label>
                    <input type="text" id="sp" value="0.0" size="5" name="sel_price"/>INR
            </tr>
            <tr>
                <td> <label>
                    Weight
                </label>
                    <input type="text" id="wt" value="0.0" size="5" name="weight"/>Kg
                </td>
            </tr>
            <tr>
                <td>
                    <INPUT TYPE="checkbox" id="tax" value="payTax">
                    Charge Tax
                </td>
                <td>
                    <INPUT TYPE="checkbox" id="ship">
                    Require a Shipping Address
                </td>

            </tr>
            <tr>
                <td>Upload Picture :<input type="file" name="photo"/></td>
            </tr>
            <tr>
                <td>Track Stock Level: <input type="checkbox" id="qu" onchange="quantity(this)"></td><td><span id="qq">Specify Quantity:</span></td>
            </tr>
            <tr>
                <td>Define New Attributes: <input type="checkbox" id="new" onchange="attr(this)"> </td>
            </tr>
            <tr>
                <td><span id="attr">Specify The Following or Create Your Own:
                    <table align="center" cellpadding="5" cellspacing="3">
                        <tr>
                            <td>
                                Variants Name:
                            </td>
                            <td>
                                <input type="text" name="var_title" value="Give it a Name">
                            </td>
                        </tr>
                        <tr>
                            <td>Size:</td>
                            <td><input type="text" name="size" size="3"/></td>

                        </tr>
                        <tr>
                            <td>
                                Color:
                            </td>
                            <td>
                                <input type="text" name="color" size="6">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Material:
                            </td>
                            <td>
                                <input type="text" name="mat" size="6">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Style:
                            </td>
                            <td>
                                <input type="text" name="style" size="6">
                            </td>
                        </tr>
                        <tr>
                            <td><input type="button" id="newat" value="Create New Attribute"></td>
                        </tr>
                        <tr><td><span id="div_attr"></span></td>
                            <td><span id="div_value"></span> </td>
                        </tr>
                    </table>
                </span>

                </td>


            </tr>
            <td>
                <input name="akhilesh" type="hidden" id="xyz" value="">
                <input name="coll" type="hidden" id="collc" value="">
                <input name="ptype" type="hidden" id="ptc" value="">
                <input name="vendors" type="hidden" id="venc" value="">
                <input name="tax" type="hidden" id="tc" value="">
                <input name="ship_addr" type="hidden" id="sc" value="">
                <input name="quan" type="hidden" id="un" value="">
                <input name="fields" type="hidden" value="${fields.id}">
                <input type="button" value="Create" id="z"/>

            </td>
        </tr>


        </table>

    </form>
    <script type="text/javascript" src="<g:resource dir="js" file="script1.js" />"></script>
</div>

</body>
</html>