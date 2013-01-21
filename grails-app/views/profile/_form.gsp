<%@ page import="sheepers.Profile" %>



<div style="margin-bottom: 30px" class="fieldcontain ${hasErrors(bean: profileInstance, field: 'userPhoneNumber', 'error')} ">
	<label for="userPhoneNumber">
		<g:message code="profile.userPhoneNumber.label" default="User Phone Number" />
		
	</label>
	<g:textField name="userPhoneNumber" value="${profileInstance?.userPhoneNumber}"/>
</div>
<!--
<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'auctions', 'error')} ">
	<label for="auctions">
		<g:message code="profile.auctions.label" default="Auctions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${profileInstance?.auctions?}" var="a">
    <li><g:link controller="auction" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="auction" action="create" params="['profile.id': profileInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'auction.label', default: 'Auction')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'bids', 'error')} ">
	<label for="bids">
		<g:message code="profile.bids.label" default="Bids" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${profileInstance?.bids?}" var="b">
    <li><g:link controller="bid" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bid" action="create" params="['profile.id': profileInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bid.label', default: 'Bid')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="profile.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${sheepers.User.list()}" optionKey="id" required="" value="${profileInstance?.user?.id}" class="many-to-one"/>
</div>

-->