<%@ page import="sheepers.Bid" %>



<div class="fieldcontain ${hasErrors(bean: bidInstance, field: '_amount', 'error')} required">
	<label for="_amount">
		<g:message code="bid._amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="_amount" value="${fieldValue(bean: bidInstance, field: '_amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidInstance, field: '_auction', 'error')} required">
	<label for="_auction">
		<g:message code="bid._auction.label" default="Auction" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="_auction" name="_auction.id" from="${sheepers.Auction.list()}" optionKey="id" required="" value="${bidInstance?._auction?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidInstance, field: '_bidId', 'error')} required">
	<label for="_bidId">
		<g:message code="bid._bidId.label" default="Bid Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="_bidId" type="number" value="${bidInstance._bidId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidInstance, field: '_bid_user', 'error')} required">
	<label for="_bid_user">
		<g:message code="bid._bid_user.label" default="Biduser" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="_bid_user" name="_bid_user.id" from="${sheepers.SUser.list()}" optionKey="id" required="" value="${bidInstance?._bid_user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bidInstance, field: '_date', 'error')} required">
	<label for="_date">
		<g:message code="bid._date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="_date" precision="day"  value="${bidInstance?._date}"  />
</div>

