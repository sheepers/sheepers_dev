<%@ page import="sheepers.Auction" %>


<!--
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
</li> -->
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'deadlineDate', 'error')} required">
	<label for="deadlineDate">
		<g:message code="auction.deadlineDate.label" default="Deadline Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="deadlineDate" precision="day"  value="${auctionInstance?.deadlineDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'fromAdr', 'error')} ">
	<label for="fromAdr">
		<g:message code="auction.fromAdr.label" default="From Adr" />
		
	</label>
	<g:textField name="fromAdr" value="${auctionInstance?.fromAdr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="auction.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${auctionInstance?.items?}" var="i">
    <li><g:link controller="auctionItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="auctionItem" action="create" params="['auction.id': auctionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'auctionItem.label', default: 'AuctionItem')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="auction.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${auctionInstance?.name}"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'user', 'error')} required">
	<label for="profile">
		<g:message code="auction.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${sheepers.User.list()}" optionKey="id" required="" value="${auctionInstance?.user?.id}" class="many-to-one"/>
</div> -->

<div style="margin-bottom: 30px" class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'toAdr', 'error')} ">
	<label for="toAdr">
		<g:message code="auction.toAdr.label" default="To Adr" />
		
	</label>
	<g:textField name="toAdr" value="${auctionInstance?.toAdr}"/>
</div>


