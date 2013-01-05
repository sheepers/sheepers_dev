
<%@ page import="sheepers.Bid" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bid.label', default: 'Bid')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bid" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bid" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bid">
			
				<g:if test="${bidInstance?._amount}">
				<li class="fieldcontain">
					<span id="_amount-label" class="property-label"><g:message code="bid._amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="_amount-label"><g:fieldValue bean="${bidInstance}" field="_amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidInstance?._auction}">
				<li class="fieldcontain">
					<span id="_auction-label" class="property-label"><g:message code="bid._auction.label" default="Auction" /></span>
					
						<span class="property-value" aria-labelledby="_auction-label"><g:link controller="auction" action="show" id="${bidInstance?._auction?.id}">${bidInstance?._auction?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidInstance?._bidId}">
				<li class="fieldcontain">
					<span id="_bidId-label" class="property-label"><g:message code="bid._bidId.label" default="Bid Id" /></span>
					
						<span class="property-value" aria-labelledby="_bidId-label"><g:fieldValue bean="${bidInstance}" field="_bidId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidInstance?._bid_user}">
				<li class="fieldcontain">
					<span id="_bid_user-label" class="property-label"><g:message code="bid._bid_user.label" default="Biduser" /></span>
					
						<span class="property-value" aria-labelledby="_bid_user-label"><g:link controller="SUser" action="show" id="${bidInstance?._bid_user?.id}">${bidInstance?._bid_user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidInstance?._date}">
				<li class="fieldcontain">
					<span id="_date-label" class="property-label"><g:message code="bid._date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="_date-label"><g:formatDate date="${bidInstance?._date}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bidInstance?.id}" />
					<g:link class="edit" action="edit" id="${bidInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
