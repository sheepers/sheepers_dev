package sheepers

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class BidController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bidInstanceList: Bid.list(params), bidInstanceTotal: Bid.count()]
    }

    def create() {
        [bidInstance: new Bid(params)]
    }

    def save() {
        def user = User.get(sec.loggedInUserInfo(field: "id").toLong())
        params.setProperty('bid_profile.id',user.profile.id)
        def bidInstance = new Bid(params)
        if (!bidInstance.save(flush: true)) {
            render(view: "create", model: [bidInstance: bidInstance])
            return
        }

        log.info 'broadcasting'
        def  msg = new JSON (Aid:bidInstance.auction.id, Amnt: bidInstance.amount, Un: bidInstance.bid_profile.user.username, Bid:bidInstance.id, Ac: "N"    )
        broadcaster['/atmosphere/Bids'].broadcast(msg)
        //broadcaster['/atmosphere/Bids'].broadcast("$bidInstance.auction.id , $bidInstance.amount ,  $bidInstance.bid_profile.user.username , $bidInstance.id , N ")

        flash.message = message(code: 'default.created.message', args: [message(code: 'bid.label', default: 'Bid'), bidInstance.id])
        render '<p></p><div class="alert alert-success fade in"> <button class="close" data-dismiss="alert" type="button">×</button> הצעתך הוגשה. בהצלחה. </div>'
//   redirect(action: "list")
    }

    def show(Long id) {
        def bidInstance = Bid.get(id)
        if (!bidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "list")
            return
        }

        [bidInstance: bidInstance.amount]
    }

    def edit(Long id) {
        def bidInstance = Bid.get(id)
        if (!bidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "list")
            return
        }

        [bidInstance: bidInstance]
    }

    def update(Long id, Long version) {
        def bidInstance = Bid.get(id)
        if (!bidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bidInstance.version > version) {
                bidInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'bid.label', default: 'Bid')] as Object[],
                        "Another user has updated this Bid while you were editing")
                render(view: "edit", model: [bidInstance: bidInstance])
                return
            }
        }

        bidInstance.properties = params

        if (!bidInstance.save(flush: true)) {
            render(view: "edit", model: [bidInstance: bidInstance])
            return
        }

        log.info 'broadcasting'
        def  msg = new JSON (Aid:bidInstance.auction.id, Amnt: bidInstance.amount, Un: bidInstance.bid_profile.user.username, Bid:bidInstance.id, Ac: "U"    )
        broadcaster['/atmosphere/Bids'].broadcast(msg)
        //broadcaster['/atmosphere/Bids'].broadcast("$bidInstance.auction.id , $bidInstance.amount , $bidInstance.bid_profile.user.username , $bidInstance.id , U ")
        flash.message = message(code: 'default.updated.message', args: [message(code: 'bid.label', default: 'Bid'), bidInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def bidInstance = Bid.get(id)
        if (!bidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "list")
            return
        }

        try {
            bidInstance.delete(flush: true)
            log.info 'broadcasting'
            def  msg = new JSON (Aid:bidInstance.auction.id, Amnt: bidInstance.amount, Un: bidInstance.bid_profile.user.username, Bid:bidInstance.id, Ac: "D"    )
            broadcaster['/atmosphere/Bids'].broadcast(msg)
           // broadcaster['/atmosphere/Bids'].broadcast("$bidInstance.auction.id , $bidInstance.amount , $bidInstance.bid_profile.user.username , $bidInstance.id , D ")
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "show", id: id)
        }
    }
}
