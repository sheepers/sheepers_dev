
<%@ page import="sheepers.Auction" %>
<%@ page import="sheepers.UserController" %>
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
</head>
<body dir="rtl" class=" pull-right">
<div class="container-fluid">
 <ul  dir="rtl" class="breadcrumb">
        <li>האזור האישי שלי</li>
  </ul>
<div dir="rtl" class="well-white">
<div>
    <g:link class="create icon-wrench" controller="Auction" action="create" ></g:link>
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
            </div>
            <div   class="span6 pull-right well-white " dir="rtl" id="auctions">
                    <g:each in="${Auction.list()}" var="auction">
                     <div  id="auction_num_${auction.id}" onclick="kvetch('auction_num_${auction.id}')" >

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



<script type="text/javascript">
    function kvetch( controleron){

            if  ($("#"+controleron).hasClass('open'))
            {
                $("#auctions").children('div.open').each(function(){
                    $(this).removeClass('open');
                    $(this).children('ul').each(function(){
                        $(this).addClass('hidden');
                    });
                    $(this).animate({height:'30px'},200,function(){});
                })

             }
            else
            {
                $("#auctions").children('div.open').each(function(){
                    $(this).removeClass('open');
                    $(this).children('ul').each(function(){
                        $(this).addClass('hidden');
                    });
                    $(this).animate({height:'30px'},200,function(){});
                });

                $("#"+controleron).animate({height: '300px'},200,function(){});
                $("#"+controleron).addClass('open');
                $("#"+controleron).children("ul.hidden").each(function(){
                    $(this).removeClass("hidden");
                });
                $("#bids").children("span").text(controleron.toString());

            }
        }

</script>
</body>

</html>

