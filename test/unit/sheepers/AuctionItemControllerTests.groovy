package sheepers



import org.junit.*
import grails.test.mixin.*

@TestFor(AuctionItemController)
@Mock(AuctionItem)
class AuctionItemControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/auctionItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.auctionItemInstanceList.size() == 0
        assert model.auctionItemInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.auctionItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.auctionItemInstance != null
        assert view == '/auctionItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/auctionItem/show/1'
        assert controller.flash.message != null
        assert AuctionItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/auctionItem/list'

        populateValidParams(params)
        def auctionItem = new AuctionItem(params)

        assert auctionItem.save() != null

        params.id = auctionItem.id

        def model = controller.show()

        assert model.auctionItemInstance == auctionItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/auctionItem/list'

        populateValidParams(params)
        def auctionItem = new AuctionItem(params)

        assert auctionItem.save() != null

        params.id = auctionItem.id

        def model = controller.edit()

        assert model.auctionItemInstance == auctionItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/auctionItem/list'

        response.reset()

        populateValidParams(params)
        def auctionItem = new AuctionItem(params)

        assert auctionItem.save() != null

        // test invalid parameters in update
        params.id = auctionItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/auctionItem/edit"
        assert model.auctionItemInstance != null

        auctionItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/auctionItem/show/$auctionItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        auctionItem.clearErrors()

        populateValidParams(params)
        params.id = auctionItem.id
        params.version = -1
        controller.update()

        assert view == "/auctionItem/edit"
        assert model.auctionItemInstance != null
        assert model.auctionItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/auctionItem/list'

        response.reset()

        populateValidParams(params)
        def auctionItem = new AuctionItem(params)

        assert auctionItem.save() != null
        assert AuctionItem.count() == 1

        params.id = auctionItem.id

        controller.delete()

        assert AuctionItem.count() == 0
        assert AuctionItem.get(auctionItem.id) == null
        assert response.redirectedUrl == '/auctionItem/list'
    }
}
