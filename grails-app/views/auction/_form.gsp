<%@ page import="sheepers.Auction" %>
<%@ page import="sheepers.ImageController" %>

<div class="container-fluid" id="AucForm">
    <div class="row-fluid">
        <div class="span9 offset3">
                <!-- ADDRESS-->
            <div class="pull-right">

                %{--<div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'fromAdr', 'error')} ">--}%
                <span class="form-inline">

                        <g:textField class="input-mini" id="${auctionInstance?.id}_fromFloor" name="fromFloor"  placeholder="קומה" value="${auctionInstance?.fromFloor}"/>
                        %{--<label class="control-label " for="fromFloor">קומה </label>--}%
                        <g:textField   id="${auctionInstance?.id}_fromAdr" name="fromAdr"   placeholder="הכנס כתובת יציאה" value="${auctionInstance?.fromAdr}"/>
                        %{--<label class="control-label" for="fromAdr" data-toggle="tooltip" title="first tooltip"> מאיפה יוצאים </label>--}%
                        <g:hiddenField id="${auctionInstance?.id}_fromAdrLat" name="fromAdrLat" value="${auctionInstance?.fromAdrLat}"/>
                        <g:hiddenField id="${auctionInstance?.id}_fromAdrLng" name="fromAdrLng" value="${auctionInstance?.fromAdrLng}"/>
            %{--<g:textField name="ooo" value="aaa" placeholder="mmm" />--}%
                <br>

                %{--</div>--}%
                %{--<div  class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'toAdr', 'error')} ">--}%

                        <g:textField class="input-mini" id="${auctionInstance?.id}_toFloor" name="toFloor" placeholder="קומה" value="${auctionInstance?.toFloor}"/>
                        %{--<label for="toFloor">קומה </label>--}%
                        <g:textField id="${auctionInstance?.id}_toAdr" name="toAdr" placeholder="הכנס כתובת הגעה"  value="${auctionInstance?.toAdr}"/>
                        %{--<label  class="control-label" for="toAdr"> לאן מגיעים</label>--}%
                        <g:hiddenField id="${auctionInstance?.id}_toAdrLat" name="toAdrLat" value="${auctionInstance?.toAdrLat}"/>
                        <g:hiddenField id="${auctionInstance?.id}_toAdrLng" name="toAdrLng" value="${auctionInstance?.toAdrLng}"/>
                %{--</div>--}%
                </span>
            </div>
        </div>
     <!-- ITEMS -->
        <div class="row-fluid">
        <div class="pull-right">
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'items', 'error')} ">
                    <label for="items">
                        <g:message code="auction.items.label" default="בחר פריטים להעברה:" />
                    </label>
                                        <ul id="item_list" class="thumbnails">
                                             <g:each in="${auctionInstance.items}" var="item" status="i">

                                                <li class=well id="item_${i}" >
                                                        <div class="thumbnail" >
                                                                <img alt="120x150" style="width: 120px; height: 150px;" src="../images/${item.typeOfItem}.jpg">
                                                                <div class="caption pull-right">
                                                                        <p> <ul>
                                                                                <li >פריט: ${item.typeOfItem}</li>
                                                                                 <li >בגודל: ${item.size}</li>
                                                                                 <li >כמות: ${item.amountOfBoxes}</li></ul></p>
                                                                        <p><a class="btn btn-danger"  onclick=removeItem(${i})  href="#">הסר</a> </p>
                                                                    </div>
                                                            </div>
                                                    </li>
                                                       <r:script>

                                                       var lastItem = ${i};
                                                       </r:script>

                                                 </g:each>
                                        </ul>
                                        <p><a data-toggle="modal" class="btn btn-success" href="#addItem">הוסף פריט</a> </p>
                                        <div class="modal hide fade" id="addItem" role="dialog">

                                            <div class="modal-body">
                                                <label>פריט</label>
                                                    <select name="item_select" id="item_select">

                                                        <option value="Extra">Extra</option>
                                                        <option value="Box">Box</option>
                                                        <option value="Table">Table</option>
                                                        <option value="Stove">Stove</option>
                                                        <option value="Refrigerator">Refrigerator</option>
                                                        <option value="Piano">Piano</option>
                                                        <option value="Bed">Bed</option>
                                                        <option value="Closet">Closet</option>

                                                    </select>
                                                    <label>גודל</label>
                                                   <select name="item_size" id="item_size">
                                                            <option value="XtraLarge">XtraLarge</option>
                                                            <option value="Large">Large</option>
                                                            <option value="Medium">Medium</option>
                                                            <option value="Small">Small</option>
                                                        </select>

                                                 <label>כמות</label>
                                               <input name="item_amount" id="item_amount"/>
                                                <label>הערות</label>
                                                <input name="item_comments" id="item_comments"/>
                                            </div>
                                            <div class="modal-footer">
                                                    <button class="btn-info" data-dismiss="modal" onclick=addItem(item_select.value,item_size.value,item_amount.value,item_comments.value) >הוסף</button>
                                                        </div>
                                            </div>

                    %{--<ul class="one-to-many">--}%
                        %{--<table class="table table-condensed table-hover" data="{tableName:'items'}">--}%
                            %{--<thead>--}%
                            %{--<tr>--}%
                                %{--<th data="{required:false, name:'comments', placeholder:'הערות'}">הערות </th>--}%
                                %{--<th data="{required:false, name:'amountOfBoxes', placeholder:'מספר' }">מספר</th>--}%
                                %{--<th data="{required:true, name:'size', placeholder:'Required', selectType:true, fromList:'[Small,Medium,Large,XtraLarge]'}">גודל </th>--}%
                                %{--<th data="{required:true, name:'typeOfItem', placeholder:'Required', selectType:true, fromList:'[Closet,Bed,Piano,Refrigerator,Stove,Table,Box,Extra]'}">סוג</th>--}%
                                %{--<th data="{editable:false}">&nbsp;</th>--}%
                            %{--</tr>--}%
                            %{--</thead>--}%
                            %{--<tbody>--}%
                            %{--<g:each in="${auctionInstance?.items}" var="p" status="i">--}%
                                %{--<tr rowId="${i}">--}%
                                    %{--<td>${p.typeOfItem}</td>--}%
                                    %{--<td>${p.size}</td>--}%
                                    %{--<td>${p.amountOfBoxes}</td>--}%
                                    %{--<td>${p.comments}</td>--}%
                                    %{--<td><r:img class="deleteRowButton" dir='images' file='skin/database_delete.png'/></td>--}%
                                %{--</tr>--}%
                            %{--</g:each>--}%
                            %{--</tbody>--}%
                        %{--</table>--}%

                        %{--<a class="btn btn-small btn-info" id="addItemLink" href="#">הוסף פריט</a>--}%


                    %{--</ul>--}%

                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="pull-right">
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
            <div class="pull-right">
                <div class="fieldcontain ${hasErrors(bean: auctionInstance, field: 'deadlineDate', 'error')} required">
                    <label for="deadlineDate">
                        <g:message code="auction.deadlineDate.label" default="תאריך מבוקש" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField id="${auctionInstance?.id}_date" class="DP" name="deadlineDate" value="${auctionInstance?.deadlineDate?.dateString}"  />
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

                <div id="myCarousel_${auctionInstance.id}" class="carousel slide hide">
                    <!-- Carousel items -->

                    <div id="CarouselIn_${auctionInstance.id}" class="carousel-inner">

                    </div>
                    <!-- Carousel nav -->
                    <a class="carousel-control right" href="#myCarousel_${auctionInstance.id}" data-slide="prev">&lsaquo;</a>
                    <a class="carousel-control left" href="#myCarousel_${auctionInstance.id}" data-slide="next">&rsaquo;</a>
                </div>
            </div>
        </div>

    </div>
</div>


<r:script>

function removeItem(itemId){
        $("#item_" + itemId).remove();
        $("#item_list").append("<input type='hidden' name='items[" + itemId + "].deleted' value='true' />");
}

function addItem(item_select,item_size,item_amount,item_comments){

    lastItem = lastItem + 1;
    htmlstr = "<li id='item_" + lastItem +"' class='well' >" +
                                "<div class='thumbnail'>" +
                               "<img alt='120x150' style='width: 120px; height: 150px;' src='../images/" + item_select + ".jpg'>" +
                                "<div class='caption pull-right'>" +
                                "<p><ul><li > פריט: " + item_select + " </li><input name='items["+ lastItem + "].typeOfItem'  value='" + item_select + "' type='hidden'/><li>בגודל: "  + item_size +" </li><input name='items["+ lastItem + "].size'  value='" + item_size + "' type='hidden'/><li>כמות: " + item_amount +"</li><input  name='items["+ lastItem + "].amountOfBoxes'  value='" + item_amount + "' type='hidden'/></ul><input  name='items["+ lastItem + "].comments'  value='" + item_comments + "' type='hidden'/></p>" +
                                "<p><a class='btn btn-danger' onclick='removeItem(" + lastItem + ")' href='#'>הסר</a> </p>" +
                                "</div> </div> </li>";

                                $("#item_list").append(htmlstr);

}


   function showImg(aucId){
  if ($("#CarouselIn_" + aucId ).children('div').length > 0 ){
        $("#myCarousel_" + aucId ).removeClass("hide");
        $("#CarouselIn_" + aucId ).children('div').last().addClass('active');
   }
   }

   $(function() {
        <g:remoteFunction id="${auctionInstance.id}" action="getImages" controller="image" update="[success:'CarouselIn_' + auctionInstance.id  ]"  onComplete="showImg(${auctionInstance.id})"/>
    // table managment script

//        $.metadata.setType("attr", "data");

        %{--$("table").writetable({--}%
            %{--autoAddRow: false,--}%
            %{--rowAdded: function( event, row ) {--}%
                %{--console.debug("in the rowAdded callback");--}%
%{--//                $(row).children("td").last().append('<r:img class="deleteRowButton" dir="images" file="skin/database_delete.png"/>');--}%
                  %{--$(row).children("td").last().append('<i class="icon-trash"/>');--}%
            %{--},--}%
            %{--rowSelected: function(event, row) {--}%
                %{--console.debug("in the rowSelected callback");--}%
            %{--},--}%
            %{--rowRemoved: function(event, row) {--}%
                %{--console.debug("in the rowRemoved callback handler");--}%
                %{--var rowId =  $(row).attr('rowId');--}%
                %{--$(row).parent().append("<input type='hidden' name='items[" + rowId + "].deleted' value='true' />");--}%
%{--//                event.stopPropagation();--}%
            %{--}--}%
        %{--});--}%

        %{--$("#addItemLink").click(function() {--}%
            %{--console.debug("in the click handler");--}%
            %{--$("table").writetable("addRow");--}%
             %{--return false;--}%
        %{--});--}%

        %{--$('img.deleteRowButton').on("click", function(event) {--}%
            %{--console.debug("in the deleteRowButton click handler");--}%
            %{--var target = $(event.target);--}%
            %{--var row = target.closest('tr');--}%
            %{--$('table').writetable('removeRow', event, row);--}%
        %{--});--}%

    });
</r:script>



