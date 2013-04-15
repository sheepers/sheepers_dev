<%@ page import="sheepers.Auction" %>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span9 offset3">
                <!-- ADDRESS-->
            <div class="well pull-right">

                %{--<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'fromAdr', 'error')} ">--}%
                <span class="form-inline">

                        <g:textField class="input-mini" name="fromFloor"  placeholder="מספר" value="${auctionInstance?.fromFloor}"/>
                        <label class="control-label " for="fromFloor">קומה </label>
                        <g:textField  name="fromAdr"   placeholder="הכנס כתובת" value="${auctionInstance?.fromAdr}"/>
                        <label class="control-label" for="fromAdr" data-toggle="tooltip" title="first tooltip"> מאיפה יוצאים </label>
                <br>

                %{--</div>--}%
                %{--<div  class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'toAdr', 'error')} ">--}%

                        <g:textField class="input-mini" name="toFloor" placeholder="מספר" value="${auctionInstance?.toFloor}"/>
                        <label for="toFloor">קומה </label>
                        <g:textField name="toAdr" placeholder="הכנס כתובת"  value="${auctionInstance?.toAdr}"/>
                        <label  class="control-label" for="toAdr"> לאן מגיעים</label>

                %{--</div>--}%
                </span>
            </div>
        </div>
     <!-- ITEMS -->
        <div class="row-fluid">
        <div class="well pull-right">
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'items', 'error')} ">
                    <label for="items">
                        <g:message code="auction.items.label" default="Items" />
                    </label>


                    %{--<ul class="one-to-many">--}%
                        <table class="table table-condensed table-hover" data="{tableName:'items'}">
                            <thead>
                            <tr>
                                <th data="{required:true, name:'typeOfItem', placeholder:'Required', selectType:true, fromList:'[Closet, Bed, Piano, Refrigerator, Stove, Table, Box, Extra]'}">Type of item</th>
                                <th data="{required:true, name:'size', placeholder:'Required', selectType:true, fromList:'[Small,Medium,Large,XtraLarge]'}">Size </th>
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

                        <a class="btn btn-primary" id="addItemLink" href="#">Add Item</a>


                    %{--</ul>--}%

                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="well pull-right">
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'IsElevator', 'error')} ">
                    <span class="form-inline pull-right">
                        <label for="IsElevator">יש מעלית  </label>
                        <g:checkBox name="IsElevator" value="${auctionInstance?.IsElevator}"/>
                        <label for="disassmble">אני צריך פירוק והרכבה</label>
                        <g:checkBox name="disassmble" value="${auctionInstance?.disassmble}"/>
                    </span>
               </div>
            </div>
            </div>
        <div class="row-fluid">
            <div class="well pull-right">
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'deadlineDate', 'error')} required">
                    <label for="deadlineDate">
                        <g:message code="auction.deadlineDate.label" default="Deadline Date" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField id="dp2" name="deadlineDate" value="${auctionInstance?.deadlineDate}"  />
                    %{--<input id="dp2" class="span2" type="text" data-date-format="mm/dd/yy" value="${auctionInstance?.deadlineDate}"></input>--}%
                </div>
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'maxAmount', 'error')} ">
                    <label for="maxAmount">
                        <g:message code="auction.maxAmount.label" default="maxAmount" />

                    </label>
                    <g:textField name="maxAmount" value="${auctionInstance?.maxAmount}"/>
                </div>
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'comments', 'error')} ">
                    <label for="comments">הערות נוספות </label>
                    <g:textArea cols="1" rows="5" name="comments" value="${auctionInstance?.comments}"/>
                </div>
            </div>
        </div>

    </div>
</div>


<r:script>
    $(function(){
     $('#dp2').datepicker().on('changeDate',function(){
         $('#dp2').datepicker('hide');
        });
    })
</r:script>
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

