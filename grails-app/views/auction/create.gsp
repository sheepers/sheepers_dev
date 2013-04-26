<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'auction.label', default: 'Auction')}" />
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
        <r:require module="application"/>
        <r:require module="forms"/>
        <r:layoutResources/>
	</head>
	<body>

        %{--<div class="container-fluid">--}%
		<div id="create-auction"  role="main">
			%{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
            <div class="page-header">
            <h1 dir="rtl" >זה מה שיש לי להוביל </h1>
            </div>
            <g:if test="${flash.message}">
			<div class="message rowüfluid" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${auctionInstance}">
			<ul class="errors text-error row-fluid" role="alert">
				<g:eachError bean="${auctionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

             <g:form method="post"  >
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit  class="btn btn-primary pull-right"  action="save" id="save" value="צור חדש"/>

                </fieldset>
            </g:form>
    </div>
        %{--</div>--}%

        <r:layoutResources/>
    </body>
</html>
