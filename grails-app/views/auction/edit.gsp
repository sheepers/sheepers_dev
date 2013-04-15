<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'auction.label', default: 'Auction')}" />
        <r:require module="application"/>
        <r:layoutResources/>
	</head>
	<body>



		<div id="edit-auction" role="main">
            <div class="page-header">
                <h1 dir="rtl">זה מה שיש לי להוביל</h1>
             </div>
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
			<g:form method="post" class="from-inline" >
				<g:hiddenField name="id" value="${auctionInstance?.id}" />
				<g:hiddenField name="version" value="${auctionInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
                    <g:actionSubmit class="btn btn-primary pull-right" action="update" value="עדכן" />
					<g:actionSubmit class="btn btn-danger pull-right" action="delete" value="מחק" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
    <r:layoutResources/>
	</body>
</html>
