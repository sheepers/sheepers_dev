<%@ page import="sheepers.Auction" %>



<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'auctionId', 'error')} required">
	<label for="auctionId">
		<g:message code="auction.auctionId.label" default="Auction Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="auctionId" type="number" value="${auctionInstance.auctionId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'bids', 'error')} ">
	<label for="bids">
		<g:message code="auction.bids.label" default="Bids" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${auctionInstance?.bids?}" var="b">
    <li><g:link controller="bid" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bid" action="create" params="['auction.id': auctionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bid.label', default: 'Bid')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'fromAdr', 'error')} required">
	<label for="fromAdr">
		<g:message code="auction.fromAdr.label" default="From Adr" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fromAdr" name="fromAdr.id" from="${sheepers.Address.list()}" optionKey="id" required="" value="${auctionInstance?.fromAdr?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="auction.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${auctionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'toAdr', 'error')} required">
	<label for="toAdr">
		<g:message code="auction.toAdr.label" default="To Adr" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="toAdr" name="toAdr.id" from="${sheepers.Address.list()}" optionKey="id" required="" value="${auctionInstance?.toAdr?.id}" class="many-to-one"/>
</div>

