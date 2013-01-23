
<%@ page import="sheepers.AuctionItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auctionItem.label', default: 'AuctionItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-auctionItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-auctionItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="size" title="${message(code: 'auctionItem.size.label', default: 'Size')}" />
					
						<g:sortableColumn property="typeOfItem" title="${message(code: 'auctionItem.typeOfItem.label', default: 'Type Of Item')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${auctionItemInstanceList}" status="i" var="auctionItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					

						<td>${fieldValue(bean: auctionItemInstance, field: "size")}</td>
					
						<td>${fieldValue(bean: auctionItemInstance, field: "typeOfItem")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${auctionItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
