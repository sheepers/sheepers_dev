package sheepers

import org.springframework.dao.DataIntegrityViolationException

class ProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

   /* def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [profileInstanceList: Profile.list(params), profileInstanceTotal: Profile.count()]
    }
     */
    def create() {
        [profileInstance: new Profile(params)]
    }

    def save() {
        def profileInstance = new Profile(params)
        if (!profileInstance.save(flush: true)) {
            render(view: "create", model: [profileInstance: profileInstance])
            return
        }
        transfer(profileInstance.user.getId())
        flash.message = message(code: 'default.created.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])
        redirect(action: "show", id: profileInstance.id)
    }

    def show(Long id) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(uri: "/")
            return
        }

        [profileInstance: profileInstance]
    }

    def edit(Long id) {
        def user = User.get(sec.loggedInUserInfo(field: 'id').toLong())
        def profileInstance = user.profile
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(uri: "/")
            return
        }

        [profileInstance: profileInstance]
    }

    def update(Long id, Long version) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(uri: "/")
            return
        }

        if (version != null) {
            if (profileInstance.version > version) {
                profileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'profile.label', default: 'Profile')] as Object[],
                        "Another user has updated this Profile while you were editing")
                render(view: "edit", model: [profileInstance: profileInstance])
                return
            }
        }

        profileInstance.properties = params

        if (!profileInstance.save(flush: true)) {
            render(view: "edit", model: [profileInstance: profileInstance])
            return
        }
        transfer(profileInstance.user.getId())
        flash.message = message(code: 'default.updated.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])
        redirect(action: "show", id: profileInstance.id)
    }

    def delete(Long id) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(uri: "/")
            return
        }

        try {
            profileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(uri: "/")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), id])
            redirect(action: "show", id: id)
        }
    }

    private transfer = { Long userId ->
        String tmpStorageDirectory =  servletContext.getRealPath("/") + grailsApplication.config.fileupload.directory ?: '/Users/Ofir/sheepers_dev/user-images'

        String newStorageDirectory = tmpStorageDirectory + '/' + userId
        tmpStorageDirectory += '/' + userId + '/tmp'

        def newStorageDirectoryFolder = new File(newStorageDirectory)
        if (!newStorageDirectoryFolder.exists()) {
            newStorageDirectoryFolder.mkdirs()
        }

        newStorageDirectoryFolder.eachFile {
            if(it.isFile()){
                it.delete()
            }
        }
        def folder = new File("$tmpStorageDirectory")

        folder.eachFile {
            if (it.isFile()) {
                def tmpFile = new File(it.path)
                def newFile = new File(newStorageDirectory + '/' + it.name)
                tmpFile.withInputStream { is ->
                    newFile << is
                }
            }
        }
        folder.deleteDir()

    }

}
