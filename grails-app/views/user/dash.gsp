
<%@ page import="sheepers.Auction" %>
<%@ page import="sheepers.UserController" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">

    <title>Dashboard</title>
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
        <li><g:link class="list" action="list" controller= "Auction" params="[ user: sec.username() ]">Auction list</g:link> </li>
        <li><g:link class="create" controller="Auction" action="create">Create new auction</g:link></li>
        <li><g:link class="edit" controller="Profile" action="edit">Edit profile</g:link></li>
     </ul>
</div>
</body>
</html>
