package sheepers

import org.springframework.dao.DataIntegrityViolationException

class SUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [SUserInstanceList: SUser.list(params), SUserInstanceTotal: SUser.count()]
    }

    def create() {
        [SUserInstance: new SUser(params)]
    }

    def save() {
        def SUserInstance = new SUser(params)
        if (!SUserInstance.save(flush: true)) {
            render(view: "create", model: [SUserInstance: SUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'SUser.label', default: 'SUser'), SUserInstance.id])
        redirect(action: "show", id: SUserInstance.id)
    }

    def show(Long id) {
        def SUserInstance = SUser.get(id)
        if (!SUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SUser.label', default: 'SUser'), id])
            redirect(action: "list")
            return
        }

        [SUserInstance: SUserInstance]
    }

    def edit(Long id) {
        def SUserInstance = SUser.get(id)
        if (!SUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SUser.label', default: 'SUser'), id])
            redirect(action: "list")
            return
        }

        [SUserInstance: SUserInstance]
    }

    def update(Long id, Long version) {
        def SUserInstance = SUser.get(id)
        if (!SUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SUser.label', default: 'SUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (SUserInstance.version > version) {
                SUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'SUser.label', default: 'SUser')] as Object[],
                        "Another user has updated this SUser while you were editing")
                render(view: "edit", model: [SUserInstance: SUserInstance])
                return
            }
        }

        SUserInstance.properties = params

        if (!SUserInstance.save(flush: true)) {
            render(view: "edit", model: [SUserInstance: SUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'SUser.label', default: 'SUser'), SUserInstance.id])
        redirect(action: "show", id: SUserInstance.id)
    }

    def delete(Long id) {
        def SUserInstance = SUser.get(id)
        if (!SUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'SUser.label', default: 'SUser'), id])
            redirect(action: "list")
            return
        }

        try {
            SUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'SUser.label', default: 'SUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'SUser.label', default: 'SUser'), id])
            redirect(action: "show", id: id)
        }
    }
}
