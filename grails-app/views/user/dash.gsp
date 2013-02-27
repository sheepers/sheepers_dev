
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
<div class="container-fluid ">
    <div class="row-fluid">
                    <!--Sidebar content-->
            <ul class="unstyled" dir="rtl" id="auctions">
               <li><g:link class="create" controller="Auction" action="create"><h4>צור מכרז חדש</h4></g:link></li>

                    <g:each in="${Auction.list()}" var="auction">
                     <div class="well" id="auction_num_${auction.id}" onclick="kvetch('auction_num_${auction.id}')" >

                         <span>העברה מ ${auction.fromAdr} ל ${auction.toAdr} בתאריך ${auction.deadlineDate.dateString}</span>
                        <g:link class="edit icon-edit" controller="Auction" action="edit" id="${auction.id}">  </g:link>
                         <ul class="hidden">
                         <li>נוצרה בתאריך ${auction.dateCreated.dateString}</li>
                         <li>פריטים בהעברה</li>
                         <g:each in="${auction.items}"  var="item">
                          <div> ${item.amountOfBoxes} ${item.size} ${item.typeOfItem} </div>
                         </g:each>
                         </ul>
                     </div>
                    </g:each>

                <li><g:link class="edit" controller="Profile" action="edit" >ערוך את הפרופיל האישי שלך</g:link></li>
            </ul>
         </div>
</div>
<div dir="rtl">
    <iframe src="http://www.facebook.com/plugins/like.php?href=sheepers.co.il" scrolling="no" frameborder="0" style="border:none; width:450px; height:80px"></iframe>
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
                });
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

            }
        }

</script>
</body>

</html>

