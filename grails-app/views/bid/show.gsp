
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
			
				<g:if test="${bidInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="bid.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${bidInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidInstance?.auction}">
				<li class="fieldcontain">
					<span id="auction-label" class="property-label"><g:message code="bid.auction.label" default="Auction" /></span>
					
						<span class="property-value" aria-labelledby="auction-label"><g:link controller="auction" action="show" id="${bidInstance?.auction?.id}">${bidInstance?.auction?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidInstance?.bidId}">
				<li class="fieldcontain">
					<span id="bidId-label" class="property-label"><g:message code="bid.bidId.label" default="Bid Id" /></span>
					
						<span class="property-value" aria-labelledby="bidId-label"><g:fieldValue bean="${bidInstance}" field="bidId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidInstance?.bid_user}">
				<li class="fieldcontain">
					<span id="bid_user-label" class="property-label"><g:message code="bid.bid_user.label" default="Biduser" /></span>
					
						<span class="property-value" aria-labelledby="bid_user-label"><g:link controller="SUser" action="show" id="${bidInstance?.bid_user?.id}">${bidInstance?.bid_user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bid.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bidInstance?.dateCreated}" /></span>
					
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
