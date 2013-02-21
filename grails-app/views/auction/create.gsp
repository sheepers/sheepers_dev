<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auction.label', default: 'Auction')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <link href="../css/datepicker.css" rel="stylesheet">
        <r:require module="application"/>
        <r:layoutResources/>
        <r:require module="bootstrap"/>
	</head>
	<body>

        %{--<div class="container-fluid">--}%
		<div id="create-auction" class="offset1"  role="main">
			%{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
             <div class="pull-right">
            <h1>זה מה שיש לי להוביל </h1>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${auctionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${auctionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
            </div>
            <g:form method="post"  >
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit  class="btn btn-primary pull-right" action="save" id="save" value="צור חדש"/>
                    <g:actionSubmit class="btn btn-primary pull-right" action="create" value="create" />
                </fieldset>
            </g:form>

         </div>
        %{--</div>--}%
    <r:layoutResources/>
    </body>
</html>
