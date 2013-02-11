<%@ page import="sheepers.Auction" %>


<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'deadlineDate', 'error')} required">
	<label for="deadlineDate">
		<g:message code="auction.deadlineDate.label" default="Deadline Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="deadlineDate" precision="day"  value="${auctionInstance?.deadlineDate}"  />
</div>

<table>
<tr>
<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'fromAdr', 'error')} ">

    <td><label class="control-label" for="fromAdr">Source Address</label></td>
    <td><g:textField  name="fromAdr" placeholder="Source address" value="${auctionInstance?.fromAdr}"/></td>
    <td><label class="control-label" for="fromFloor">Floor </label></td>
    <td><g:textField name="fromFloor" value="${auctionInstance?.fromFloor}"/></td>
</div>
</tr>

<tr>
<div style="margin-top: 10px; margin-bottom: 10px" class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'toAdr', 'error')} ">

    <td><label for="toAdr"> Destination Address</label></td>
    <td><g:textField name="toAdr" value="${auctionInstance?.toAdr}"/></td>
    <td><label for="toFloor">Floor</label></td>
    <td><g:textField name="toFloor" value="${auctionInstance?.toFloor}"/></td>
</div>
</tr>
</table>
<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="auction.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
    <table data="{tableName:'items'}">
      <thead>
        <tr>
            <th data="{required:true, name:'typeOfItem', placeholder:'Required', selectType:true, fromList:'${sheepers.EtypeOfItem.values().toString()}'}">Type of item</th>
            <th data="{required:true, name:'size', placeholder:'Required', selectType:true, fromList:'${sheepers.ESize.values().toString()}'}">Size </th>
            <th data="{required:false, name:'amountOfBoxes', placeholder:'Required' }">Amount of boxes</th>
            <th data="{required:false, name:'comments', placeholder:'Required'}">Comments </th>
            <th data="{editable:false}">&nbsp;</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${auctionInstance?.items}" var="p" status="i">
            <tr rowId="${i}">
                <td>${p.typeOfItem}</td>
                <td>${p.size}</td>
                <td>${p.amountOfBoxes}</td>
                <td>${p.comments}</td>
                <td><r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <li class="add"><a id="addItemLink" href="#">Add Item</a></li>


</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'IsElevator', 'error')} ">
    <span class="form-inline">
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



<r:script>
    $(function() {
        $.metadata.setType("attr", "data");

        $("table").writetable({
            autoAddRow: false,
            rowAdded: function( event, row ) {
                console.debug("in the rowAdded callback");
                $(row).children("td").last().append('<r:img class="deleteRowButton" dir="images" file="skin/database_delete.png"/>');
            },
            rowSelected: function(event, row) {
                console.debug("in the rowSelected callback");
            },
            rowRemoved: function(event, row) {
                console.debug("in the rowRemoved callback handler");
                var rowId =  $(row).attr('rowId');
                $(row).parent().append("<input type='hidden' name='items[" + rowId + "].deleted' value='true' />");
//                event.stopPropagation();
            }
        });

        $("#addItemLink").click(function() {
            console.debug("in the click handler");
            $("table").writetable("addRow");
             return false;
        });

        $('img.deleteRowButton').on("click", function(event) {
            console.debug("in the deleteRowButton click handler");
            var target = $(event.target);
            var row = target.closest('tr');
            $('table').writetable('removeRow', event, row);
        });

    });
</r:script>

