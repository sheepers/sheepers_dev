<div  id="list-auction" class="content scaffold-list" role="main" xmlns="http://www.w3.org/1999/html">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <h1>תוצאות החיפוש:</h1>
    <ul class="item">
        <g:each in="${auctionInstanceList}" status="i" var="auctionInstance">
            %{--<g:link action="show" id="${auctionInstance.id}">--}%
                <li>
                    <h2>הובלת דירה  </h2>
                    <p> תוקף: <g:formatDate type="date" style="short" date="${auctionInstance.deadlineDate}" /> </p>
                    <p>סכום מבוקש: ${fieldValue(bean: auctionInstance, field: "maxAmount")}</p>
                    <p> מ ${fieldValue(bean: auctionInstance, field: "fromAdr")} </p>
                    <p> ל ${fieldValue(bean: auctionInstance, field: "toAdr")} </p>
                    <p> ${fieldValue(bean: auctionInstance, field: "disassmble")} </p>
                    <button class="btn btn-mini btn-success"> הרחב</button>
                </li>
            %{--</g:link>--}%
        </g:each>
    </ul>
    %{--<div class="pagination">--}%
        %{--<g:paginate total="${auctionInstanceTotal}" />--}%
    %{--</div>--}%
</div>