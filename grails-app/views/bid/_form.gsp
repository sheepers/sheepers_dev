<%@ page import="sheepers.Bid" %>



<div class="fieldcontain ${hasErrors(bean: bidInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="bid.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" value="${fieldValue(bean: bidInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidInstance, field: 'auction', 'error')} required">
	<label for="auction">
		<g:message code="bid.auction.label" default="Auction" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="auction" name="auction.id" from="${sheepers.Auction.list()}" optionKey="id" required="" value="${bidInstance?.auction?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidInstance, field: 'bidId', 'error')} required">
	<label for="bidId">
		<g:message code="bid.bidId.label" default="Bid Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bidId" type="number" value="${bidInstance.bidId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidInstance, field: 'bid_user', 'error')} required">
	<label for="bid_user">
		<g:message code="bid.bid_user.label" default="Biduser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bid_user" name="bid_user.id" from="${sheepers.SUser.list()}" optionKey="id" required="" value="${bidInstance?.bid_user?.id}" class="many-to-one"/>
</div>

