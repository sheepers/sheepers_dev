
<%@ page import="sheepers.Profile; sheepers.User; sheepers.Auction" %>
<%@ page import="sheepers.Bid; sheepers.ESize; sheepers.EtypeOfItem" %>
<%@ page import="sheepers.UserController" %>
<%@ page import="grails.converters.JSON" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <meta name="layout" content="main">
    <title>Dashboard</title>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
    <r:require module="application"/>
    <r:layoutResources/>
</head>
<body dir="rtl" class=" pull-right">
<g:set var="userId" value="${sec.loggedInUserInfo(field: 'username')}"/>
<g:set var="userType" value="${User.findByUsername(userId.toString()).profile.userType}" />
<g:if test="${userType=='Customer'}" >


<div class="container-fluid">
 <ul  dir="rtl" class="breadcrumb">
        <li>האזור האישי שלי</li>
  </ul>
<div dir="rtl" class="well-white">
<div>
    <a  href="#AuctionCreateModal" role="button"  class="create icon-tasks"  data-remote="../auction/create"   data-toggle="modal"  ></a>
    <a  href="#AuctionCreateModal"  role="button"  class="create"    data-remote="../auction/create" data-toggle="modal"  >צור מכרז חדש</a>
</div>
<div>
    <g:link class="edit icon-user" controller="Profile" action="edit" />
    <g:link class="edit" controller="Profile" action="edit">ערוך את הפרופיל האישי שלך</g:link>
</div>
</div>
    <div class="row-fluid ">
            <div class=" well span4 " id="bids">
            <span class="pull-right"><h5>בחר במכרז מן הרשימה </h5></span>

             <table id="cur_bids" class="pull-right table">

             </table>
            </div>
            <div   class="span8 pull-right well " dir="rtl" id="auctions">
                    <ul id="auctions_nav" class="nav nav-tabs">
                        <g:each in="${Auction.list()}" var="auction">
                            <li class=""><a data-toggle="tab" title='העברה מ ${auction.fromAdr} ל ${auction.toAdr} בתאריך ${auction.deadlineDate.dateString}' href="#auction_num_${auction.id}" onclick="kvetch('${auction.id}','${auction.bids.amount.toString()}','${auction.bids.bid_profile.user.username.toString()}')">${auction.deadlineDate.dateString}</a></li>
                        </g:each>
                    </ul>
                    <div id="auctions_content" class="tab-content">
                        <g:each in="${Auction.list()}" var="auction">
                            <div id="auction_num_${auction.id}" class="tab-pane fade">
                                <a  href="#AuctionEditModal${auction.id}" role="button"  class="edit icon-edit"  data-remote="../auction/edit/${auction.id}"   data-toggle="modal"  ></a>
                            <div class="modal hide fade " id="AuctionEditModal${auction.id}"  role="dialog">
                                <div class="modal-header">
                                    <div class="container-fluid">
                                        <a href="" id="closeEditModal${auction.id}" data-dismiss="modal" class=" pull-left icon-remove" ></a>
                                    </div>
                                </div>
                                <div class="modal-body">
                                </div>
                                </div>
                                <span>העברה מ ${auction.fromAdr} ל ${auction.toAdr} בתאריך ${auction.deadlineDate.dateString}</span>

                                <ul >
                                    <li>נוצרה בתאריך ${auction.dateCreated.dateString}</li>
                                    <li>פריטים בהעברה</li>
                                    <g:each in="${auction.items}"  var="item">
                                        <div> ${item.amountOfBoxes} ${item.size} ${item.typeOfItem} </div>
                                    </g:each>
                                </ul>
                            </div>
                        </g:each>
                     </div>
                <!--
                    <g:each in="${Auction.list()}" var="auction">
                     <div  id="auction_num_${auction.id}" onclick="kvetch('${auction.id}','${auction.bids.amount.toString()}','${auction.bids.bid_profile.user.username.toString()}')">

                         <g:link class="edit icon-edit" controller="Auction" action="edit" id="${auction.id}">  </g:link>
                         <span>העברה מ ${auction.fromAdr} ל ${auction.toAdr} בתאריך ${auction.deadlineDate.dateString}</span>

                         <ul class="hidden">
                         <li>נוצרה בתאריך ${auction.dateCreated.dateString}</li>
                         <li>פריטים בהעברה</li>
                         <g:each in="${auction.items}"  var="item">
                         <div> ${item.amountOfBoxes} ${item.size} ${item.typeOfItem} </div>
                         </g:each>
                         </ul>
                     </div>
                    </g:each>
                -->
             </div>

         </div>
    <div class="pull-left">
        <iframe src="http://www.facebook.com/plugins/like.php?href=sheepers.co.il" scrolling="no" frameborder="0" style="border:none; width:450px; height:80px"></iframe>
    </div>

</div>
</g:if>
<g:if test="${userType=='Carrier'}">
    <div>Im a carrier - let me bid</div>
    %{--<div class="container-fluid">--}%
    %{--<g:textField name="fromArea" value="fromwhere"/>--}%
    %{--<g:textField name="toArea" value="towhere"/>--}%
    %{--<g:textField name="date" value="dateoftransport"/>--}%

    <a href="" class=""> link to search page for auctions</a>
    %{--</div>--}%

</g:if>

<div class="modal hide fade " id="AuctionCreateModal"  role="dialog">
    <div class="modal-header">
        <div class="container-fluid">
            <a href="" id="closeCreateModal" data-dismiss="modal" class=" pull-left icon-remove" ></a>
        </div>
    </div>
    <div class="modal-body">
    </div>

</div>
<r:script>

    function kvetch( controleron, bids_amounts, bidders){
                $("#cur_bids").children("th").each(function(){
                  $(this).remove();
                });
                $("#cur_bids").children("tbody").each(function(){
                   $(this).remove();
                });
                $("#bids").animate({minHeight: '1px'},50,function(){});
                $("#cur_bids").children("th").each(function(){
                    $(this).remove();
                });
                $("#cur_bids").children("tbody").each(function(){
                    $(this).remove();
                });
                $("#bids").children("span").text("");
                bids_amounts = bids_amounts.replace("[","");
                bidders = bidders.replace("]","");
                bids_amounts = bids_amounts.replace("]","");
                bidders = bidders.replace("[","");
                bidAmountArray = bids_amounts.split(",");
                biddersArray = bidders.split(",");
                $("#bids").animate({minHeight: '300px'},200,function(){
                    $("#cur_bids"). append('<th>סכום</th><th>משוב</th><th>מוביל</th>');
                    for (var i = 0; i < bidAmountArray.length; i += 1) {


                        $("#cur_bids"). append('<tr><td>' +  bidAmountArray[i] + '</td><td></td><td>' + biddersArray[i] + '</td></tr>');
                    }
                });


        }

</r:script>
<r:layoutResources/>
</body>

</html>

