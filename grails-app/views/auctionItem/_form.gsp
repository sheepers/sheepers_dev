<%@ page import="sheepers.AuctionItem" %>




<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'size', 'error')} ">
	<label for="size">
		<g:message code="auctionItem.size.label" default="Size" />
		
	</label>
	<g:select from="${sheepers.ESize.values()}" name="size" value="${auctionItemInstance?.size}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'typeOfItem', 'error')} ">
	<label for="typeOfItem">
		<g:message code="auctionItem.typeOfItem.label" default="typeOfItem" />
		
	</label>
	<g:select from="${sheepers.EtypeOfItem.values()}" name="typeOfItem" value="${auctionItemInstance?.typeOfItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'amountOfBoxes', 'error')} ">
     <label for="typeOfItem">
        <g:message code="auctionItem.amountOfBoxes.label" default="amountOfBoxes"   />

     </label>
     <g:textField name="amountOfBoxes" value="${auctionItemInstance?.amountOfBoxes}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: auctionItemInstance, field: 'comments', 'error')} ">
    <label for="comments">
        <g:message code="auctionItem.comments.label" default="comments"  />

    </label>
    <g:textArea cols="1" rows="5" name="comments" value="${auctionItemInstance?.comments}"/>
</div>


