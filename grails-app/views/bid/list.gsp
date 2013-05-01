
<%@ page import="sheepers.Bid" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bid.label', default: 'Bid')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bid" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bid" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'bid.amount.label', default: 'Amount')}" />
					
						<th><g:message code="bid.auction.label" default="Auction" /></th>
					
						<th><g:message code="bid.bid_profile.label" default="Bidprofile" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bid.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bidInstanceList}" status="i" var="bidInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bidInstance.id}">${fieldValue(bean: bidInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: bidInstance, field: "auction")}</td>
					
						<td>${fieldValue(bean: bidInstance, field: "bid_profile")}</td>
					
						<td><g:formatDate date="${bidInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bidInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
