
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
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/user/dash')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div style="margin: 20px 20px 20px 20px">

    <ul>
        <h1>Welcome <sec:username/></h1>
        <li><g:link class="create" controller="Auction" action="create">Create new auction</g:link></li>
        <div class="accordion" id="accordion2">
        <g:each in="${Auction.list()}" var="auction">
            <div class="accordion-group">
                <div class="accordion-heading">
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
</div>
</body>
</html>
