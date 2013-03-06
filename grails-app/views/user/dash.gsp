
<%@ page import="sheepers.Auction" %>
<%@ page import="sheepers.Bid" %>
<%@ page import="sheepers.UserController" %>
<%@ page import="grails.converters.JSON" %>
<!DOCTYPE html>
<html dir="rtl">
<head>
    <meta name="layout" content="main">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <script src="../js/bootstrap.js"></script>
    <title>Dashboard</title>
    <link href="../css/bootstrap.css" rel="stylesheet"/>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet"/>
    <r:require module="application"/>
    <r:layoutResources/>
</head>
<body dir="rtl" class=" pull-right">
<div class="container-fluid">
 <ul  dir="rtl" class="breadcrumb">
        <li>האזור האישי שלי</li>
  </ul>
<div dir="rtl" class="well-white">
<div>
    <g:link class="create icon-tasks" controller="Auction" action="create" ></g:link>
    <g:link class="create" controller="Auction" action="create">צור מכרז חדש</g:link>
</div>
<div>
    <g:link class="edit icon-user" controller="Profile" action="edit" ></g:link>
    <g:link class="edit" controller="Profile" action="edit">ערוך את הפרופיל האישי שלך</g:link>
</div>
</div>
    <div class="row-fluid ">
            <div class=" well-white span6 " id="bids">
            <span class="pull-right">בחר במכרז מן הרשימה </span>
             <table id="cur_bids" class="pull-right">

             </table>
            </div>
            <div   class="span6 pull-right well-white " dir="rtl" id="auctions">
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
             </div>

         </div>
    <div class="pull-left">
        <iframe src="http://www.facebook.com/plugins/like.php?href=sheepers.co.il" scrolling="no" frameborder="0" style="border:none; width:450px; height:80px"></iframe>
    </div>

</div>



<r:script>
    function kvetch( controleron, bids_amounts, bidders){

            if  ($("#auction_num_"+controleron).hasClass('open'))
            {
                $("#auctions").children('div.open').each(function(){
                    $(this).removeClass('open');
                    $(this).children('ul').each(function(){
                        $(this).addClass('hidden');
                    });
                    $(this).animate({minHeight:'1px'},200,function(){});
                })
                $("#bids").children("span").text("בחר במכרז מן הרשימה ");
                $("#cur_bids").children("th").each(function(){
                  $(this).remove();
                });
                $("#cur_bids").children("tbody").each(function(){
                   $(this).remove();
                });
                $("#bids").animate({minHeight: '1px'},200,function(){});


             }
            else
            {
                $("#auctions").children('div.open').each(function(){
                    $(this).removeClass('open');
                    $(this).children('ul').each(function(){
                         $(this).addClass('hidden');
                    });
                    $(this).animate({minHeight:'1px'},200,function(){});
                });
                $("#cur_bids").children("th").each(function(){
                    $(this).remove();
                });
                $("#cur_bids").children("tbody").each(function(){
                    $(this).remove();
                });
                $("#bids").animate({minHeight: '1px'},200,function(){});


                $("#auction_num_"+controleron).animate({minHeight : '300px'},200,function(){});
                $("#auction_num_"+controleron).addClass('open');
                $("#auction_num_"+controleron).children("ul.hidden").each(function(){
                    $(this).removeClass("hidden");
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
        }

</r:script>
<r:layoutResources/>
</body>

</html>

