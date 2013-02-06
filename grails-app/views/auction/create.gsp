<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auction.label', default: 'Auction')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <r:require module="application"/>
	</head>
	<body>
        <!-- change -->
		<div id="create-auction" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form class="form-horizontal" action="save" >
                <div class="control-group">
                    <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'deadlineDate', 'error')} required">
                        <label for="deadlineDate">
                            <g:message code="auction.deadlineDate.label" default="Deadline Date" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:datePicker name="deadlineDate" precision="day"  value="${auctionInstance?.deadlineDate}"  />
                    </div>
                </div>
             </g:form>

            <!--from addr-->
            <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'fromAdr', 'error')} ">

                <span>
                    <g:form class="form-inline">
                        <label class="control-label" for="fromAdr">Source Address</label>
                        <div class="controls">
                            <g:textField  name="fromAdr" placeholder="Source address" value="${auctionInstance?.fromAdr}"/>
                        </div>


                        <label class="control-label" for="fromFloor">
                            <g:message code="auction.fromFloor.label" default="Floor" />
                        </label>
                        <div class="controls">
                            <g:textField name="fromFloor" value="${auctionInstance?.fromFloor}"/>
                        </div>
                    </g:form>
                </span>
            </div>





            <fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>

		</div>
	</body>
</html>
