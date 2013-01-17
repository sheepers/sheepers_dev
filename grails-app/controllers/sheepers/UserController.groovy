package sheepers

import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource

class UserController extends grails.plugins.springsecurity.ui.UserController {

   def dash = {render view: 'dash'}

    def create = {
        def user = lookupUserClass().newInstance(params)
        [user: user, authorityList: sortedRoles()]
    }

    def save = {
        def user = lookupUserClass().newInstance(params)
        if (params.password) {
            String salt = saltSource instanceof NullSaltSource ? null : params.username
            user.password = springSecurityUiService.encodePassword(params.password, salt)
        }
        if (!user.profile)
        {
            user.profile = new Profile()
        }
        if (!user.save(flush: true)) {
            render view: 'create', model: [user: user, authorityList: sortedRoles()]
            return
        }
        addRoles(user)
        flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])}"
        redirect action: edit, id: user.id
    }

}
