
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
		<div id="list-auction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'auction.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="deadlineDate" title="${message(code: 'auction.deadlineDate.label', default: 'Deadline Date')}" />
					
						<g:sortableColumn property="fromAdr" title="${message(code: 'auction.fromAdr.label', default: 'From Adr')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'auction.name.label', default: 'Name')}" />
					
						<th><g:message code="auction.user.username.label" default="User" /></th>
					
						<g:sortableColumn property="toAdr" title="${message(code: 'auction.toAdr.label', default: 'To Adr')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${auctionInstanceList}" status="i" var="auctionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:formatDate date="${auctionInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${auctionInstance.deadlineDate}" /></td>
					
						<td>${fieldValue(bean: auctionInstance, field: "fromAdr")}</td>

                        <td><g:link action="show" id="${auctionInstance.id}">${fieldValue(bean: auctionInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: auctionInstance, field: "profile.user.username")}</td>
					
						<td>${fieldValue(bean: auctionInstance, field: "toAdr")}</td>
					
					</tr>

				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${auctionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
