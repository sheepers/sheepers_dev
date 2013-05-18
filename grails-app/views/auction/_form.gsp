<%@ page import="sheepers.Auction" %>
<div class="container-fluid" id="AucForm">
    <div class="row-fluid">
        <div class="span9 offset3">
                <!-- ADDRESS-->
            <div class="well pull-right">

                %{--<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'fromAdr', 'error')} ">--}%
                <span class="form-inline">

                        <g:textField class="input-mini" name="fromFloor"  placeholder="קומה" value="${auctionInstance?.fromFloor}"/>
                        %{--<label class="control-label " for="fromFloor">קומה </label>--}%
                        <g:textField   name="fromAdr"   placeholder="הכנס כתובת יציאה" value="${auctionInstance?.fromAdr}"/>
                        %{--<label class="control-label" for="fromAdr" data-toggle="tooltip" title="first tooltip"> מאיפה יוצאים </label>--}%
                        <g:hiddenField name="fromAdrLat" value="${auctionInstance?.fromAdrLat}"/>
                        <g:hiddenField name="fromAdrLng" value="${auctionInstance?.fromAdrLng}"/>
            %{--<g:textField name="ooo" value="aaa" placeholder="mmm" />--}%
                <br>

                %{--</div>--}%
                %{--<div  class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'toAdr', 'error')} ">--}%

                        <g:textField class="input-mini" name="toFloor" placeholder="קומה" value="${auctionInstance?.toFloor}"/>
                        %{--<label for="toFloor">קומה </label>--}%
                        <g:textField name="toAdr" placeholder="הכנס כתובת הגעה"  value="${auctionInstance?.toAdr}"/>
                        %{--<label  class="control-label" for="toAdr"> לאן מגיעים</label>--}%
                        <g:hiddenField name="toAdrLat" value="${auctionInstance?.toAdrLat}"/>
                        <g:hiddenField name="toAdrLng" value="${auctionInstance?.toAdrLng}"/>
                %{--</div>--}%
                </span>
            </div>
        </div>
     <!-- ITEMS -->
        <div class="row-fluid">
        <div class="well pull-right">
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'items', 'error')} ">
                    <label for="items">
                        <g:message code="auction.items.label" default="בחר פריטים להעברה:" />
                    </label>


                    %{--<ul class="one-to-many">--}%
                        <table class="table table-condensed table-hover" data="{tableName:'items'}">
                            <thead>
                            <tr>
                                <th data="{required:false, name:'comments', placeholder:'הערות'}">הערות </th>
                                <th data="{required:false, name:'amountOfBoxes', placeholder:'מספר' }">מספר</th>
                                <th data="{required:true, name:'size', placeholder:'Required', selectType:true, fromList:'[Small,Medium,Large,XtraLarge]'}">גודל </th>
                                <th data="{required:true, name:'typeOfItem', placeholder:'Required', selectType:true, fromList:'[Closet,Bed,Piano,Refrigerator,Stove,Table,Box,Extra]'}">סוג</th>
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

                        <a class="btn btn-small btn-info" id="addItemLink" href="#">הוסף פריט</a>


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
                        <g:message code="auction.deadlineDate.label" default="תאריך מבוקש" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField id="dp2" name="deadlineDate" value="${auctionInstance?.deadlineDate}"  />
                    %{--<input id="dp2" class="span2" type="text" data-date-format="mm/dd/yy" value="${auctionInstance?.deadlineDate}"></input>--}%
                </div>
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'maxAmount', 'error')} ">
                    <label for="maxAmount">
                        <g:message code="auction.maxAmount.label" default="סכום מקסימלי" />
                    </label>
                    <span class="add-on">ש"ח</span>
                    <g:textField name="maxAmount" value="${auctionInstance?.maxAmount}"/>
                    <span class="add-on">.00</span>
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


        var options = {
//           types: ['(cities)'],
           componentRestrictions: {country: 'il'}
        };

        var fromInput = document.getElementById("fromAdr");
        var fromAutocomplete = new google.maps.places.Autocomplete(fromInput,options);
        var toInput = document.getElementById("toAdr");
        var toAutocomplete = new google.maps.places.Autocomplete(toInput, options);



        google.maps.event.addListener(fromAutocomplete, 'place_changed', function() {
         var place = fromAutocomplete.getPlace();
         if (!place.geometry) {
             // Inform the user that the place was not found and return.
            fromAutocomplete.className = 'notfound';
            return;
         }
         $('#fromAdrLat').val(place.geometry.location.lat());
         $('#fromAdrLng').val(place.geometry.location.lng());
        });

        google.maps.event.addListener(toAutocomplete, 'place_changed', function() {
         var place = toAutocomplete.getPlace();
         if (!place.geometry) {
             // Inform the user that the place was not found and return.
            toAutocomplete.className = 'notfound';
            return;
         }
        $('#toAdrLat').val(place.geometry.location.lat());
         $('#toAdrLng').val(place.geometry.location.lng());

        });



    });



// table managment script
    $(function() {
        $.metadata.setType("attr", "data");

        $("table").writetable({
            autoAddRow: false,
            rowAdded: function( event, row ) {
                console.debug("in the rowAdded callback");
//                $(row).children("td").last().append('<r:img class="deleteRowButton" dir="images" file="skin/database_delete.png"/>');
                  $(row).children("td").last().append('<i class="icon-trash"/>');
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



