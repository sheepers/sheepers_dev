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

<div class="fieldcontain ${hasErrors(bean: bidInstance, field: 'bid_profile', 'error')} required">
	<label for="bid_profile">
		<g:message code="bid.bid_profile.label" default="Bidprofile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bid_profile" name="bid_profile.id" from="${sheepers.Profile.list()}" optionKey="id" required="" value="${bidInstance?.bid_profile?.id}" class="many-to-one"/>
</div>

