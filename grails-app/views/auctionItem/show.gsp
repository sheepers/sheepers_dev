
<%@ page import="sheepers.AuctionItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auctionItem.label', default: 'AuctionItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-auctionItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-auctionItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list auctionItem">
			
				<g:if test="${auctionItemInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="auctionItem.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${auctionItemInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionItemInstance?.amountOfBoxes}">
				<li class="fieldcontain">
					<span id="amountOfBoxes-label" class="property-label"><g:message code="auctionItem.amountOfBoxes.label" default="Amount Of Boxes" /></span>
					
						<span class="property-value" aria-labelledby="amountOfBoxes-label"><g:fieldValue bean="${auctionItemInstance}" field="amountOfBoxes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionItemInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="auctionItem.size.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${auctionItemInstance}" field="size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionItemInstance?.typeOfItem}">
				<li class="fieldcontain">
					<span id="typeOfItem-label" class="property-label"><g:message code="auctionItem.typeOfItem.label" default="Type Of Item" /></span>
					
						<span class="property-value" aria-labelledby="typeOfItem-label"><g:fieldValue bean="${auctionItemInstance}" field="typeOfItem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionItemInstance?.auction}">
				<li class="fieldcontain">
					<span id="auction-label" class="property-label"><g:message code="auctionItem.auction.label" default="Auction" /></span>
					
						<span class="property-value" aria-labelledby="auction-label"><g:link controller="auction" action="show" id="${auctionItemInstance?.auction?.id}">${auctionItemInstance?.auction?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${auctionItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${auctionItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
