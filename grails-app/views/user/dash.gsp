
<%@ page import="sheepers.Auction" %>
<%@ page import="sheepers.UserController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <script src="../js/bootstrap.js"></script>
    <title>Dashboard</title>
    <link href="../css/bootstrap.css" rel="stylesheet"/>

</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span4">
            <!--Sidebar content-->
            <ul class="unstyled">
                <g:link class="edit" controller="Auction" action="create"  style="float: left"><i class="icon-edit" ></i></g:link>
                <li><g:link class="create" controller="Auction" action="create"> Create new auction</g:link></li>
                <div class="accordion" id="accordion2">
                    <g:each in="${Auction.list()}" var="auction">
                        <div class="accordion-group">
                            <div class="accordion-heading">


                                <g:link class="edit" controller="Auction" action="edit" id="${auction.id}" style="float: left"><i class="icon-list" ></i></g:link>
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${auction.id}">
                                    From ${auction.fromAdr} to ${auction.toAdr} on ${auction.deadlineDate.dateString}
                                </a>

                            </div>
                            <div id="collapse${auction.id}" class="accordion-body collapse ">
                                <div class="accordion-inner">
                                    <g:each in="${auction.items}" var="item">
                                        <li>${item.amountOfBoxes} ${item.size} ${item.typeOfItem}</li>
                                    </g:each>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>
                <li><g:link class="edit" controller="Profile" action="edit" >Edit profile</g:link></li>
            </ul>
            <iframe src="http://www.facebook.com/plugins/like.php?href=YOUR_URL" scrolling="no" frameborder="0" style="border:none; width:450px; height:80px"></iframe>
        </div>
        <div class="span8">
            <!--Body content-->
        </div>
    </div>
</div>


</body>
</html>
