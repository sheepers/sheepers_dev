package sheepers

import org.springframework.dao.DataIntegrityViolationException

class AuctionItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [auctionItemInstanceList: AuctionItem.list(params), auctionItemInstanceTotal: AuctionItem.count()]
    }

    def create() {


        [auctionItemInstance: new AuctionItem(params)]
    }

    def save() {
        def auctionItemInstance = new AuctionItem(params)

        if (!auctionItemInstance.save(flush: true)) {
            render(view: "create", model: [auctionItemInstance: auctionItemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'auctionItem.label', default: 'AuctionItem'), auctionItemInstance.id])
        redirect( uri: "/Auction/show/" + auctionItemInstance.auction.id.toString())
    }

    def show(Long id) {
        def auctionItemInstance = AuctionItem.get(id)
        if (!auctionItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auctionItem.label', default: 'AuctionItem'), id])
            redirect(action: "list")
            return
        }

        [auctionItemInstance: auctionItemInstance]
    }

    def edit(Long id) {
        def auctionItemInstance = AuctionItem.get(id)
        if (!auctionItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auctionItem.label', default: 'AuctionItem'), id])
            redirect(action: "list")
            return
        }

        [auctionItemInstance: auctionItemInstance]
    }

    def update(Long id, Long version) {
        def auctionItemInstance = AuctionItem.get(id)
        if (!auctionItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auctionItem.label', default: 'AuctionItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (auctionItemInstance.version > version) {
                auctionItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'auctionItem.label', default: 'AuctionItem')] as Object[],
                          "Another user has updated this AuctionItem while you were editing")
                render(view: "edit", model: [auctionItemInstance: auctionItemInstance])
                return
            }
        }

        auctionItemInstance.properties = params

        if (!auctionItemInstance.save(flush: true)) {
            render(view: "edit", model: [auctionItemInstance: auctionItemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'auctionItem.label', default: 'AuctionItem'), auctionItemInstance.id])
        redirect(action: "show", id: auctionItemInstance.id)
    }

    def delete(Long id) {
        def auctionItemInstance = AuctionItem.get(id)
        if (!auctionItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auctionItem.label', default: 'AuctionItem'), id])
            redirect(action: "list")
            return
        }

        try {
            auctionItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'auctionItem.label', default: 'AuctionItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'auctionItem.label', default: 'AuctionItem'), id])
            redirect(action: "show", id: id)
        }
    }
}
