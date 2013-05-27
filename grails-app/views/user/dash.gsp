
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
    <r:require modules="forms"/>
    <r:require module="upload"/>

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
    <a  href="/sheepers/auction/create" role="button"  class="create icon-tasks"   ></a>
    <a  href="/sheepers/auction/create"  role="button"  class="create"   >צור מכרז חדש</a>
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
            <div   class="span8 pull-right" dir="rtl" id="auctions">
                  <div class="tabbable tabs-right">
                    <ul id="auctions_nav" class="nav nav-tabs">
                        <g:each in="${Auction.list()}" var="auction">
                            <li class="pull-right tab_trig"><a data-toggle="tab" title='העברה מ ${auction.fromAdr} ל ${auction.toAdr} בתאריך ${auction.deadlineDate.dateString}' href="#auction_num_${auction.id}" onclick="switchAuction('${auction.id}','${auction.bids.amount.toString()}','${auction.bids.bid_profile.user.username.toString()}','${auction.bids.id.toString()}')">${auction.deadlineDate.dateString}</a></li>
                        </g:each>
                    </ul>
                    <div id="auctions_content" class="tab-content">
                        <g:each in="${Auction.list()}" var="auction">
                            <div id="auction_num_${auction.id}" class="tab-pane fade well-white">

                                <g:form method="post" class="from-inline" >

                                        <g:hiddenField name="id" value="${auction.id}" />
                                        <g:hiddenField name="version" value="${auction.version}" />
                                        <fieldset class="form">
                                            <g:render template="/auction/form" model= "['auctionInstance':auction]"/>
                                        </fieldset>

                                    <fieldset class="buttons">

                                        <div id="${auction.id}_bootstrapped-fine-uploader"></div>

                                        <g:submitToRemote class="btn btn-primary pull-right" controller="Auction" action="update" value="עדכן"  update="update_auction_stat" after="closeAllTabs()" />
                                            <g:submitToRemote class="btn btn-danger pull-right" controller="Auction" action="delete" value="מחק" update="update_auction_stat" formnovalidate=""  before= "confirm ('Are you Sure?')" after="closeAllTabs()" />
                                        </fieldset>

                                </g:form>
                            </div>
                        </g:each>
                     </div>
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

%{--<div class="modal wide  hide fade" tabindex="-1" id="AuctionCreateModal"  role="dialog" aria-labelledby="createLabel">--}%
    %{--<div class="modal-header">--}%
        %{--<div class="container-fluid">--}%
        %{--<button type="button" class="close pull-left" data-dismiss="modal" aria-hidden="true">x</button>--}%
        %{--<a href="" id="closeCreateModal" data-dismiss="modal" class=" pull-left icon-remove" ></a>--}%
        %{--<h3 id="createLabel" class="pull-right">אנא מלא פרטים ליצירת הובלה חדשה</h3>--}%
        %{--</div>--}%
    %{--</div>--}%
    %{--<div class="modal-body pull-right">--}%
        %{--<a href="" id="closeCreateModal" data-dismiss="modal" class=" pull-left icon-remove" ></a>--}%

    %{--</div>--}%
    %{--<div class="modal-footer">--}%
        %{--<button data-dismiss="modal" aria-hidden="true" class="btn pull-right">ביטול</button>--}%
    %{--</div>--}%

%{--</div>--}%
<div id="update_auction_stat"></div>


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

    function closeAllTabs(){

        $(".tab-pane").each(function(){
             $(this).removeClass("active");
        });
        $(".tab_trig").each(function(){
            $(this).removeClass("active");
        });
    }

    function switchAuction( controleron, bids_amounts, bidders, bids_id){


                CurAuc = controleron;


                // Handle Date
                   $('#'+CurAuc+'_date').datepicker().on('changeDate',function(){
                     $('#'+CurAuc+'_date').datepicker('hide');
                  });

                // Handle Google



        var options = {
//           types: ['(cities)'],
            componentRestrictions: {country: 'il'}
        };

        var fromInput = document.getElementById(CurAuc+"_fromAdr");
        var fromAutocomplete = new google.maps.places.Autocomplete(fromInput,options);
        var toInput = document.getElementById(CurAuc+"_toAdr");
        var toAutocomplete = new google.maps.places.Autocomplete(toInput, options);



        google.maps.event.addListener(fromAutocomplete, 'place_changed', function() {
            var place = fromAutocomplete.getPlace();
            if (!place.geometry) {
                // Inform the user that the place was not found and return.
                fromAutocomplete.className = 'notfound';
                return;
            }
            $('#'+CurAuc+'_fromAdrLat').val(place.geometry.location.lat());
            $('#'+CurAuc+'_fromAdrLng').val(place.geometry.location.lng());
        });

        google.maps.event.addListener(toAutocomplete, 'place_changed', function() {
            var place = toAutocomplete.getPlace();
            if (!place.geometry) {
                // Inform the user that the place was not found and return.
                toAutocomplete.className = 'notfound';
                return;
            }
            $('#'+CurAuc+'_toAdrLat').val(place.geometry.location.lat());
            $('#'+CurAuc+'_toAdrLng').val(place.geometry.location.lng());

        });


        // Handle Bids
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


        //Uplader

        var uploader = new qq.FineUploader({
            element: document.getElementById(CurAuc+'_bootstrapped-fine-uploader'),

            request: {
                endpoint: '../image/upload'
            },
            validation: {
                allowedExtensions: ['jpeg', 'jpg', 'img']
//                sizeLimit: 51200 // 50 kB = 50 * 1024 bytes
            },
            text: {
                uploadButton: '<div> ...הוסף תמונות <i class="icon-plus icon-white"></i></div>',
                retryButton:  '',
                deleteButton: ''

            },
            template: '<div class="qq-uploader">' +
                    '<div class="qq-upload-button btn btn-success pull-right">{uploadButtonText}</div>' +
                    '<ul  class="qq-upload-list span4" style="margin-top: 10px; text-align: center;"></ul>' +
                    '</div>',
//                fileTemplate: '<li  class="span2">' +
//                        '<span class="qq-upload-file"></span>' +
//                        '<span class="qq-upload-size"></span>' +
//                        '<span class="qq-upload-thumbnail"></span>' +
//                        '<div class="thumbnail"> <img src="../images/grails_logo.jpg" alt="160x120"></div>' +
//                        '</li>',

            classes: {
                success: 'alert alert-success',
                fail: 'alert alert-error'


            }
//            callbacks: {
//                onComplete: function(id, fileName, responseJSON) {
//                    if (responseJSON.success) {
//                        $('#sample').append('<li class="span2">' +
//                                '<div class="thumbnail">' +
//                                '<img src="../images/grails_logo.jpg" class="img-rounded" alt="' + fileName + '">' +
//                                '</div>' +
//                                '</li>');
//                    }
//
//                }}
        });


    }



</r:script>
<r:layoutResources/>
</body>

</html>

