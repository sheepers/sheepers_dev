<%@ page import="sheepers.AuctionItem" %>



<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'isFragile', 'error')} ">
	<label for="isFragile">
		<g:message code="auctionItem.isFragile.label" default="Is Fragile" />
		
	</label>
	<g:checkBox name="isFragile" value="${auctionItemInstance?.isFragile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'size', 'error')} ">
	<label for="size">
		<g:message code="auctionItem.size.label" default="Size" />
		
	</label>
	<g:textField name="size" value="${auctionItemInstance?.size}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'typeOfItem', 'error')} ">
	<label for="typeOfItem">
		<g:message code="auctionItem.typeOfItem.label" default="Type Of Item" />
		
	</label>
	<g:textField name="typeOfItem" value="${auctionItemInstance?.typeOfItem}"/>
</div>

