
<%@ page import="sheepers.Auction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auction.label', default: 'Auction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-auction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/user/dash')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div  id="list-auction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul style="margin: 30px">
				<g:each in="${auctionInstanceList}" status="i" var="auctionInstance">
                    <g:link action="show" id="${auctionInstance.id}">
                    <li>

						From ${fieldValue(bean: auctionInstance, field: "fromAdr")}
                         To ${fieldValue(bean: auctionInstance, field: "toAdr")}
                         Due on: <g:formatDate type="date" style="short" date="${auctionInstance.deadlineDate}" />

						<!--<td>${fieldValue(bean: auctionInstance, field: "profile.user.username")}</td>-->
					</li>
                    </g:link>
				</g:each>
			</ul>
			<div class="pagination">
				<g:paginate total="${auctionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
