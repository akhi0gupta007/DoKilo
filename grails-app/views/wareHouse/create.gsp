<%@ page import="com.codebee.logistics.WareHouse" %>
<!doctype html>
<html>
	<head>
        <meta name="layout" content="logistics"/>
		<g:set var="entityName" value="${message(code: 'wareHouse.label', default: 'WareHouse')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>


			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${wareHouseInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${wareHouseInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
    <table cellspacing='3'>
			<g:form action="save" >
                <tr><td>  <label>Warehouse Name:</label></td>
                <td><g:field type="text" name="name"></g:field> </td>
                </tr>
            <tr><td><label>Warehouse Location:</label> </td>
            <td> <g:textArea name="location" rows="3" cols="33"></g:textArea></td></tr>
                  <tr><td>
                      <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                  </td></tr>


			</g:form>  </table>

	</body>
</html>
