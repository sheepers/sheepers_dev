
<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auction.label', default: 'Auction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-auction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-auction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list auction">
			
				<g:if test="${auctionInstance?.auctionId}">
				<li class="fieldcontain">
					<span id="auctionId-label" class="property-label"><g:message code="auction.auctionId.label" default="Auction Id" /></span>
					
						<span class="property-value" aria-labelledby="auctionId-label"><g:fieldValue bean="${auctionInstance}" field="auctionId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionInstance?.bids}">
				<li class="fieldcontain">
					<span id="bids-label" class="property-label"><g:message code="auction.bids.label" default="Bids" /></span>
					
						<g:each in="${auctionInstance.bids}" var="b">
						<span class="property-value" aria-labelledby="bids-label"><g:link controller="bid" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${auctionInstance?.fromAdr}">
				<li class="fieldcontain">
					<span id="fromAdr-label" class="property-label"><g:message code="auction.fromAdr.label" default="From Adr" /></span>
					
						<span class="property-value" aria-labelledby="fromAdr-label"><g:link controller="address" action="show" id="${auctionInstance?.fromAdr?.id}">${auctionInstance?.fromAdr?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="auction.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${auctionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionInstance?.toAdr}">
				<li class="fieldcontain">
					<span id="toAdr-label" class="property-label"><g:message code="auction.toAdr.label" default="To Adr" /></span>
					
						<span class="property-value" aria-labelledby="toAdr-label"><g:link controller="address" action="show" id="${auctionInstance?.toAdr?.id}">${auctionInstance?.toAdr?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${auctionInstance?.id}" />
					<g:link class="edit" action="edit" id="${auctionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
