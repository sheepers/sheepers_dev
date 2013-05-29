<div  id="list-auction" class="content scaffold-list" role="main" xmlns="http://www.w3.org/1999/html">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <h1>תוצאות החיפוש:</h1>
    <ul class="auction_item_search">
        <g:each in="${auctionInstanceList}" status="i" var="auctionInstance">
        %{--<g:link action="show" id="${auctionInstance.id}">--}%

            <li class="divider">
                <div class="well well-white">
                %{--<g:formRemote name="placeBid" url="[controller:'Auction', action:'placeBid']" params="[id:'auctionInstance.id']" >--}%
                <div class="row-fluid" dir="rtl">
                    <div class="span6">
                        <div class="auc_addtional_info_${auctionInstance.id} hide" id="auc_addtional_info_${auctionInstance.id}">
                            <div id="myCarousel_${auctionInstance.id}" class="carousel slide hide ">
                                <!-- Carousel items -->
                                <div id="CarouselIn_${auctionInstance.id}" class="carousel-inner">
                                </div>
                                <!-- Carousel nav -->
                                <a class="carousel-control right" href="#myCarousel_${auctionInstance.id}" data-slide="prev">&lsaquo;</a>
                                <a class="carousel-control left" href="#myCarousel_${auctionInstance.id}" data-slide="next">&rsaquo;</a>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <h2>הובלת דירה  </h2>
                        <p> תוקף: <g:formatDate type="date" style="short" date="${auctionInstance.deadlineDate}" /> </p>
                        <p> <g:if test="${auctionInstance.maxAmount}">סכום מבוקש: ${auctionInstance.maxAmount}</g:if></p>
                        <p>מ${auctionInstance.fromAdr} </p>
                        <p>ל${auctionInstance.toAdr} </p>
                        <p> <g:if test="${auctionInstance.disassmble}">נדרש פירוק</g:if></p>
                        <div class="auc_addtional_info_${auctionInstance.id} hide" id="auc_addtional_info_${auctionInstance.id}">
                        %{--<g:form controller="auction">--}%
                            <p id="Pbid_${auctionInstance.id}"><label for="bid_${auctionInstance.id}"> תן הצעה </label><input id="bid_${auctionInstance.id}" class="input-mini"/><button name="submitBid"  class="btn btn-success" value="שלח" onclick="submitBid('${auctionInstance.id}')" >שלח</button></p>

                            %{--<p><g:submitToRemote name="submitBid" class="btn signup-btn" value="שלח" action="placeBid" params="[id:'${auctionInstance.id}']" />  <label for="bid"> תן הצעה </label><input id="bid" class="input-mini"/></p>--}%
                         %{--</g:form>--}%
                        </div>
                        <button id="btn_${auctionInstance.id}" class="btn btn-primary" onclick="showAdditionalInfo('${auctionInstance.id}')"><i class="icon-chevron-sign-left"></i>  הצג עוד </button>
                    </div>
                </div>
                %{--</g:formRemote>--}%
                </div>
            </li>
        %{--</g:link>--}%
        </g:each>
    </ul>
    %{--<div class="pagination">--}%
    %{--<g:paginate total="${auctionInstanceTotal}" />--}%
    %{--</div>--}%
</div>
