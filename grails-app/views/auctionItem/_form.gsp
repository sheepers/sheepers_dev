<%@ page import="sheepers.AuctionItem" %>



<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="auctionItem.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${auctionItemInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'amountOfBoxes', 'error')} ">
	<label for="amountOfBoxes">
		<g:message code="auctionItem.amountOfBoxes.label" default="Amount Of Boxes" />
		
	</label>
	<g:textField name="amountOfBoxes" value="${auctionItemInstance?.amountOfBoxes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'size', 'error')} ">
	<label for="size">
		<g:message code="auctionItem.size.label" default="Size" />
		
	</label>
	<g:select name="size" from="${auctionItemInstance.constraints.size.inList}" value="${auctionItemInstance?.size}" valueMessagePrefix="auctionItem.size" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'typeOfItem', 'error')} ">
	<label for="typeOfItem">
		<g:message code="auctionItem.typeOfItem.label" default="Type Of Item" />
		
	</label>
	<g:select name="typeOfItem" from="${auctionItemInstance.constraints.typeOfItem.inList}" value="${auctionItemInstance?.typeOfItem}" valueMessagePrefix="auctionItem.typeOfItem" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'auction', 'error')} required">
	<label for="auction">
		<g:message code="auctionItem.auction.label" default="Auction" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="auction" name="auction.id" from="${sheepers.Auction.list()}" optionKey="id" required="" value="${auctionItemInstance?.auction?.id}" class="many-to-one"/>
</div>

