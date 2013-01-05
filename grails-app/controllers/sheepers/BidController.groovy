package sheepers

import org.springframework.dao.DataIntegrityViolationException

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
        def bidInstance = new Bid(params)
        if (!bidInstance.save(flush: true)) {
            render(view: "create", model: [bidInstance: bidInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bid.label', default: 'Bid'), bidInstance.id])
        redirect(action: "show", id: bidInstance.id)
    }

    def show(Long id) {
        def bidInstance = Bid.get(id)
        if (!bidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "list")
            return
        }

        [bidInstance: bidInstance]
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

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bid.label', default: 'Bid'), bidInstance.id])
        redirect(action: "show", id: bidInstance.id)
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
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bid.label', default: 'Bid'), id])
            redirect(action: "show", id: id)
        }
    }
}
