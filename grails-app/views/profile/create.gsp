<%@ page import="com.codebee.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="profile">

		<title>Profile</title>
        <style type="text/css">

        table {
            font: 11px/24px Verdana, Arial, Helvetica, sans-serif;

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

            padding: 2px;
        }

        td.width {
            width: 100%;
        }

        td.adjacent {

            text-align: center;
        }
        </style>
        <script type="text/javascript" src="<g:resource dir="js" file="jquery-1.7.2.min.js" />"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                document.getElementById("add").value = "${add}";
            });
        </script>
	</head>
	<body>

		<div>
			<h1>Manage Profile</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>


			<g:form action="save" >
			<table>
                <tr>
                    <th style="font-weight: bold;">Fill the form or Change to Save</th>
                </tr>
                <tr>
                    <td style="font-weight: bold;">
                        Your Full Name
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="fullName" placeholder="Full Name" value="${name}">
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Purpose:</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="purpose" placeholder="Purpose" value="${purpose}">
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">
                        Expertise level
                    </td>

                </tr>
                <tr>
                    <td>
                        <select name="expertise">

                            <g:if test="${expertise}">
                                <g:if test="${expertise.equals("expert")}">
                                    <option value="expert" selected="true">
                                    </g:if>
                                <g:else>
                                    <option value="expert">
                                </g:else>
                               Proficient

                                </option>

                                <g:if test="${expertise.equals("beginner")}">
                                    <option value="beginner" selected="true">
                                </g:if>
                                <g:else>
                                    <option value="beginner">
                                </g:else>

                           New In E Commerce
                        </option>

                            <g:if test="${expertise.equals("pro")}">
                                <option value="pro" selected="true">
                            </g:if>
                            <g:else>
                                <option value="pro">
                            </g:else>

                            Pro in E Commerce
                        </option>
                        </g:if>
                        <g:else>
                            <option value="pro">Pro in E Commerce</option>
                            <option value="beginner">New In E Commerce</option>
                            <option value="expert">    Pro in E Commerce</option>
                        </g:else>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">
                        Contact Information:
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone <input type="text" name="phone" size="10" value="${phone}">
                    </td>
                    <td>Mobile <input type="text" name="mobile" size="10" value="${mobile}"></td>

                </tr>
                <tr>

                    <td>
                    Address
                </td>
                </tr>
                <tr>
                    <td> <textarea name="address" placeholder="" cols="30" id="add"></textarea></td>
                </tr>
                <tr>
                    <td>
                        Country
                    </td>
                </tr>
                <tr>
                    <td><input type="text" name="country" placeholder="Country" value="${country}"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Save">
                        <input type="reset">
                    </td>
                </tr>
			</table>
			</g:form>
		</div>
	</body>
</html>
