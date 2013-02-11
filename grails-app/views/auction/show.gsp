
<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <link href="../../css/bootstrap.css" rel="stylesheet">
		<g:set var="entityName" value="${message(code: 'auction.label', default: 'Auction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-auction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/user/dash')}"><g:message code="default.home.label"/></a></li>
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
			
				<g:if test="${auctionInstance?.bids}">
				<li class="fieldcontain">
					<span id="bids-label" class="property-label"><g:message code="auction.bids.label" default="Bids" /></span>
					
						<g:each in="${auctionInstance.bids}" var="b">
						<span class="property-value" aria-labelledby="bids-label"><g:link controller="Bid" action="show" id="b.Id" >    ${fieldValue(bean: b, field: "amount")} </g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${auctionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="auction.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${auctionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionInstance?.deadlineDate}">
				<li class="fieldcontain">
					<span id="deadlineDate-label" class="property-label"><g:message code="auction.deadlineDate.label" default="Deadline Date" /></span>
					
						<span class="property-value" aria-labelledby="deadlineDate-label"><g:formatDate date="${auctionInstance?.deadlineDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionInstance?.fromAdr}">
				<li class="fieldcontain">
					<span id="fromAdr-label" class="property-label"><g:message code="auction.fromAdr.label" default="From Adr" /></span>
					
						<span class="property-value" aria-labelledby="fromAdr-label"><g:fieldValue bean="${auctionInstance}" field="fromAdr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${auctionInstance?.items}">
				<li class="fieldcontain">
					<span id="items-label" class="property-label"><g:message code="auction.items.label" default="Items" /></span>
					
						<g:each in="${auctionInstance.items}" var="i">
						<span class="property-value" aria-labelledby="items-label"><g:link controller="auctionItem" action="show" id="${i.id}"><g:fieldValue bean="${i}" field="typeOfItem"/></g:link></span>
						</g:each>
					
				</li>
				</g:if>
			

			

				<g:if test="${auctionInstance?.toAdr}">
				<li class="fieldcontain">
					<span id="toAdr-label" class="property-label"><g:message code="auction.toAdr.label" default="To Adr" /></span>
					
						<span class="property-value" aria-labelledby="toAdr-label"><g:fieldValue bean="${auctionInstance}" field="toAdr"/></span>
					
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
