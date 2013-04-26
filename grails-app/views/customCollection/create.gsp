<%@ page import="com.codebee.products.CustomCollection" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="product">
		<g:set var="entityName" value="${message(code: 'customCollection.label', default: 'CustomCollection')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		
		
		<div id="create-customCollection" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${customCollectionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${customCollectionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
		
		<table>
			<g:uploadForm action="save" >
			<tr><td>
			<label>Name:</label>
			</td><td>
			<g:textField name="name" value="${customCollection?.name}"/></td></tr>
			<tr><td>
			<label>Description:</label>
			</td><td>
			<g:textArea name="description" rows="5" cols="40"/></td>
			</tr>
			<tr>
			<td>Upload Your Photo</td><td><input name="image" type="file" />
			</td>
			</tr>
			<tr><td><g:submitButton name="register" value="Create"/>
			
			</td></tr>	
			</g:uploadForm>
		</table>
		</div>
		
	</body>
</html>
