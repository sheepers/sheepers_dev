package sheepers



import org.junit.*
import grails.test.mixin.*

@TestFor(SUserController)
@Mock(SUser)
class SUserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/SUser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.SUserInstanceList.size() == 0
        assert model.SUserInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.SUserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.SUserInstance != null
        assert view == '/SUser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/SUser/show/1'
        assert controller.flash.message != null
        assert SUser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/SUser/list'

        populateValidParams(params)
        def SUser = new SUser(params)

        assert SUser.save() != null

        params.id = SUser.id

        def model = controller.show()

        assert model.SUserInstance == SUser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/SUser/list'

        populateValidParams(params)
        def SUser = new SUser(params)

        assert SUser.save() != null

        params.id = SUser.id

        def model = controller.edit()

        assert model.SUserInstance == SUser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/SUser/list'

        response.reset()

        populateValidParams(params)
        def SUser = new SUser(params)

        assert SUser.save() != null

        // test invalid parameters in update
        params.id = SUser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/SUser/edit"
        assert model.SUserInstance != null

        SUser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/SUser/show/$SUser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        SUser.clearErrors()

        populateValidParams(params)
        params.id = SUser.id
        params.version = -1
        controller.update()

        assert view == "/SUser/edit"
        assert model.SUserInstance != null
        assert model.SUserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/SUser/list'

        response.reset()

        populateValidParams(params)
        def SUser = new SUser(params)

        assert SUser.save() != null
        assert SUser.count() == 1

        params.id = SUser.id

        controller.delete()

        assert SUser.count() == 0
        assert SUser.get(SUser.id) == null
        assert response.redirectedUrl == '/SUser/list'
    }
}
