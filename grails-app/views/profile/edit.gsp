<%@ page import="sheepers.Profile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
        <r:require modules="forms"/>
        <r:require module="upload"/>
        <r:require module="application"/>
        <r:layoutResources/>
    </head>
	<body>
    <header class="page-header pull-right">
        <span class="span12"/>
        <div class="pull-right">
            <h1> הפרופיל האישי</h1>
        </div>
    </header>

    <div class="container-fluid pull-right">

    	<div id="edit-profile" class="content scaffold-edit row-fluid" role="main">

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${profileInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profileInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${profileInstance?.id}" />
				<g:hiddenField name="version" value="${profileInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save btn-large btn-info pull-right" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>
    </div>
    <r:layoutResources/>
	</body>
</html>
