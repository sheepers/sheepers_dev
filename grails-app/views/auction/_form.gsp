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

    <span>
    <label for="fromAdr">
		Source Address
	</label>
	<g:textField  name="fromAdr" value="${auctionInstance?.fromAdr}"/>
    <label for="fromFloor">
        <g:message code="auction.fromFloor.label" default="Floor" />

    </label>
        <g:textField name="fromFloor" value="${auctionInstance?.fromFloor}"/>
    </span>
</div>


<div style="margin-bottom: 30px" class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'toAdr', 'error')} ">

    <span>
    <label for="toAdr">
        Destination Address

    </label>
    <g:textField name="toAdr" value="${auctionInstance?.toAdr}"/>
    <label for="toFloor">
        <g:message code="auction.toFloor.label" default="Floor" />

    </label>
    <g:textField name="toFloor" value="${auctionInstance?.toFloor}"/>
    </span>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="auction.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${auctionInstance?.items?}" var="i">
    <li><g:link controller="auctionItem" action="show" id="${i.id}"><g:fieldValue bean="${i}" field="typeOfItem"/></g:link></li>
</g:each>
<li class="add">
<g:link controller="auctionItem" action="create" params="['auction.id': auctionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'auctionItem.label', default: 'AuctionItem')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'IsElevator', 'error')} ">
    <span>
    <label for="IsElevator">
        YES! I Have an elevator
    </label>
    <g:checkBox name="IsElevator" value="${auctionInstance?.IsElevator}"/>
    <label for="disassmble">
        YES! I`d love some help with dismanteling

    </label>
    <g:checkBox name="disassmble" value="${auctionInstance?.disassmble}"/>
    </span>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'maxAmount', 'error')} ">
    <label for="maxAmount">
        <g:message code="auction.maxAmount.label" default="maxAmount" />

    </label>
    <g:textField name="maxAmount" value="${auctionInstance?.maxAmount}"/>
</div>

<div style="margin-bottom: 40px" class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'comments', 'error')} ">
	<label for="comments">
		I just wanna say:
	</label>
	<g:textArea cols="1" rows="5" name="comments" value="${auctionInstance?.comments}"/>
</div>

<!--<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'profile', 'error')} required">
	<label for="profile">
		<g:message code="auction.profile.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${sheepers.User.list()}" optionKey="id" required="" value="${auctionInstance?.profile?.user?.id}" class="many-to-one"/>
</div> -->



