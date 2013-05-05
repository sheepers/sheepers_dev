package sheepers

import grails.converters.JSON
import org.atmosphere.cpr.*
import org.atmosphere.cpr.AtmosphereResource.TRANSPORT
class BidService {


        static transactional = false

        static atmosphere = [mapping: '/atmosphere/Bids']

       def onRequest = { event ->
       /*     log.info "onRequest, $event"

            // Mark this connection as suspended.
            event.suspend()
        } */
        try {
            log.info "onRequest, $event"
            AtmosphereRequest req = event.request
            if (req.method.equalsIgnoreCase("GET")) {
                log.info "Suspending , $event"
                event.suspend()
            }
           /* else if (req.method.equalsIgnoreCase("POST")) {
                event.broadcaster.broadcast(req.reader.readLine().trim())
            }*/
        }
        catch (Exception e) {
            log.info"ERROR!!!!! , $event"
        }
       }

        def onStateChange = { event ->
            if (event.cancelled){
                log.info "onStateChange, cancelling $event"

            }
            else{
            AtmosphereResource r = event.resource
            AtmosphereResponse res = r.response
           /* else if (event.message) {
                log.info "onStateChange, message: ${event.message}"

                event.resource.response.writer.with {
                    write event.message
                    flush()
                }
            }*/
            try {
                log.info "onStateChange, $event"
                if (event.isSuspended()) {
                    def msg = JSON.parse(event.message.toString())
                    res.writer.write( createMessage(msg.Aid, msg.Amnt, msg.Un, msg.Bid, msg.Ac) )

                    switch (r.transport()) {
                        case TRANSPORT.JSONP:
                        case TRANSPORT.LONG_POLLING:
                            event.resource.resume()
                            break
                        default:
                            res.writer.flush()
                    }
                }
            } catch (Exception e) {
                log.info  "ERROR in onStateChange: $e"
            }
        }
    }

    private String createMessage(Integer Aid, Integer  Amnt , String  Un , Integer  Bid , String Ac  ) {
        return new JSON( [Aid : Aid, Amnt : Amnt, Un : Un, Bid: Bid, Ac:Ac] )
    }
}
