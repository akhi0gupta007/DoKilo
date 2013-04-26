
<%@ page import="com.codebee.logistics.WareHouse" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="logistics">
		<g:set var="entityName" value="${message(code: 'wareHouse.label', default: 'WareHouse')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
            width: 190px;
        }

        td.adjacent {
            border-left: 1px solid #CCC;
            text-align: center;
        }
        </style>
	</head>
	<body>


		<div id="list-wareHouse" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="name" title="${message(code: 'wareHouse.name.label', default: 'Name')}" />

						<g:sortableColumn property="location" title="${message(code: 'wareHouse.location.label', default: 'Location')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${wareHouseInstanceList}" status="i" var="wareHouseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${wareHouseInstance.id}">${fieldValue(bean: wareHouseInstance, field: "name")}</g:link></td>

						<td>${fieldValue(bean: wareHouseInstance, field: "location")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>

		</div>
	</body>
</html>
