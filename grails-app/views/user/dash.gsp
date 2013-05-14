
<%@ page import="sheepers.Profile; sheepers.User; sheepers.Auction" %>
<%@ page import="sheepers.Bid" %>
<%@ page import="sheepers.UserController" %>
<%@ page import="grails.converters.JSON" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <meta name="layout" content="main">
    <title>Dashboard</title>
    <script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&language=he&region=il"></script>
    <r:require module="application"/>
    <r:require modules="atmosphere"/>
    <r:layoutResources/>



</head>



<body dir="rtl" class=" pull-right">


<header class="page-header" dir="rtl" >
    <span class="span12"/>
    <div >
        עוברים דירה        ...
    </div>
</header>

<g:set var="userId" value="${sec.loggedInUserInfo(field: 'username')}"/>
<g:set var="userType" value="${User.findByUsername(userId.toString()).profile.userType}" />
<g:if test="${userType=='Customer'}" >


<div class="container-fluid">

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
            <div class=" span4 " id="bids">
            <span class="pull-right"><h5>בחר במכרז מן הרשימה </h5></span>

             <table id="cur_bids" class="pull-right table">

             </table>
            </div>
            <div   class="span8 pull-right  " dir="rtl" id="auctions">
                    <ul id="auctions_nav" class="nav nav-tabs">
                        <g:each in="${Auction.list()}" var="auction">
                            <li class="pull-right"><a data-toggle="tab" title='העברה מ ${auction.fromAdr} ל ${auction.toAdr} בתאריך ${auction.deadlineDate.dateString}' href="#auction_num_${auction.id}" onclick="kvetch('${auction.id}','${auction.bids.amount.toString()}','${auction.bids.bid_profile.user.username.toString()}','${auction.bids.id.toString()}')">${auction.deadlineDate.dateString}</a></li>
                        </g:each>
                    </ul>
                    <div id="auctions_content" class="tab-content">
                        <g:each in="${Auction.list()}" var="auction">
                            <div id="auction_num_${auction.id}" class="tab-pane fade well-white">
                                <a  href="#AuctionEditModal${auction.id}" role="button"  class="edit icon-edit"  data-remote="../auction/edit/${auction.id}"   data-toggle="modal"  ></a>
                            <div class="modal wide  hide fade " id="AuctionEditModal${auction.id}"  role="dialog">
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

                                <div id="myCarousel" class="carousel slide">
                                    <ol class="carousel-indicators">
                                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                        <li data-target="#myCarousel" data-slide-to="1"></li>
                                        <li data-target="#myCarousel" data-slide-to="2"></li>
                                    </ol>
                                    <!-- Carousel items -->

                                    <div class="carousel-inner">
                                        <div class="active item"><img src="http://image.subscribe.ru/list/digest/business/sheeps.jpg"/></div>
                                        <div class="item"><img src="http://www.gapa.co.il/wp-content/uploads/2011/05/900X300-Sheep-300x150.jpg"/></div>
                                        <div class="item"><img src="http://www.farmeramania.de/wp-content/blogs.dir/19/files/2011/08/sheeps_22-300x150.png"/></div>
                                    </div>
                                    <!-- Carousel nav -->
                                    <a class="carousel-control right" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                                    <a class="carousel-control left" href="#myCarousel" data-slide="next">&rsaquo;</a>
                                </div>
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

    <g:link controller="auction" action="search" >link to search page for auctions</g:link>
    %{--</div>--}%

</g:if>

<div class="modal wide  hide fade " id="AuctionCreateModal"  role="dialog">
    <div class="modal-header">
        %{--<div class="container-fluid">--}%
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>אנא מלא פרטים ליצירת הובלה חדשה</h3>
        %{--</div>--}%
    </div>
    <div class="modal-body">
        <a href="" id="closeCreateModal" data-dismiss="modal" class=" pull-left icon-remove" ></a>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn pull-right">ביטול</a>
    </div>

</div>

<r:script>
      var CurAuc = 0;
      var request = { url:'${createLink(uri:'/')}atmosphere/Bids',
        contentType : "application/json",
        logLevel : 'error',
        shared : 'false',
        transport : 'websocket' ,
        fallbackTransport: 'long-polling'};

         request.onMessage = function (response) {

        // We need to be logged first.

        var message = response.responseBody;
        //console.log('response is ')
        //console.log(response)
        //console.log('message is ' + message)
        try {
            var json = jQuery.parseJSON(message);
        } catch (e) {
            //console.log('This doesn\'t look like a valid JSON: ', message);
            return;
        }
         HandleBid(json.Aid, json.Amnt, json.Un, json.Bid, json.Ac);
    };
      //function callback(response) {
      function HandleBid(Aid, Amnt, Un, Bid, Ac) {
      //if (response.status == 200) {
        //var data = response.responseBody;
        //if (data.length > 0) {
            ////alert ("woohoo");
            if (Aid = CurAuc){
            switch (Ac){
            case 'N' :
                $('tbody').append('<tr id ="' +Bid+ '"> <td>'+Amnt+ '</td><td></td><td>' +Un+'</td> </tr>');
                break;
             case 'U' :
                $("#" + Bid ).remove();
                $('tbody').append('<tr id ="' +Bid+ '"> <td>'+Amnt+ '</td><td></td><td>' +Un+'</td> </tr>');
                break;
             case 'D' :
                $("#" + Bid ).remove();
                break;
            }
            $("#" + Bid ).animate({"color":"#3a87ad"},1000).delay(500);
            $("#" + Bid ).animate({"color":" #333"},1000);
            $("#" + Bid ).animate({"color":"#3a87ad"},1000).delay(500);
            $("#" + Bid ).animate({"color":" #333"},1000);
            }


   };

   // var url = '${createLink(uri:'/')}atmosphere/Bids';
    //$.atmosphere.subscribe(url, callback, $.atmosphere.request = {transport:'long-polling'});
    $.atmosphere.subscribe(request);
</r:script>

<r:script>

    function kvetch( controleron, bids_amounts, bidders, bids_id){
                CurAuc = controleron;
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
                bids_id = bids_id.replace("]","");
                bids_amounts = bids_amounts.replace("]","");
                bidders = bidders.replace("[","");
                bids_id = bids_id.replace("[","");
                bidAmountArray = bids_amounts.split(",");
                biddersArray = bidders.split(",");
                bids_idArray = bids_id.split(",");
                $("#bids").animate({minHeight: '300px'},200,function(){
                    $("#cur_bids"). append('<th >סכום</th><th>משוב</th><th>מוביל</th>');

                    for (var i = 0; i < bidAmountArray.length; i += 1) {


                        $("#cur_bids"). append('<tr id=' + bids_idArray[i] + '><td>' +  bidAmountArray[i] + '</td><td></td><td>' + biddersArray[i] + '</td></tr>');
                    }
                });


        }


</r:script>
<r:layoutResources/>
</body>

</html>

