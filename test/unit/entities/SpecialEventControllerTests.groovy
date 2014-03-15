package entities



import org.junit.*
import grails.test.mixin.*

@TestFor(SpecialEventController)
@Mock(SpecialEvent)
class SpecialEventControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/specialEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.specialEventInstanceList.size() == 0
        assert model.specialEventInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.specialEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.specialEventInstance != null
        assert view == '/specialEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/specialEvent/show/1'
        assert controller.flash.message != null
        assert SpecialEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/specialEvent/list'

        populateValidParams(params)
        def specialEvent = new SpecialEvent(params)

        assert specialEvent.save() != null

        params.id = specialEvent.id

        def model = controller.show()

        assert model.specialEventInstance == specialEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/specialEvent/list'

        populateValidParams(params)
        def specialEvent = new SpecialEvent(params)

        assert specialEvent.save() != null

        params.id = specialEvent.id

        def model = controller.edit()

        assert model.specialEventInstance == specialEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/specialEvent/list'

        response.reset()

        populateValidParams(params)
        def specialEvent = new SpecialEvent(params)

        assert specialEvent.save() != null

        // test invalid parameters in update
        params.id = specialEvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/specialEvent/edit"
        assert model.specialEventInstance != null

        specialEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/specialEvent/show/$specialEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        specialEvent.clearErrors()

        populateValidParams(params)
        params.id = specialEvent.id
        params.version = -1
        controller.update()

        assert view == "/specialEvent/edit"
        assert model.specialEventInstance != null
        assert model.specialEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/specialEvent/list'

        response.reset()

        populateValidParams(params)
        def specialEvent = new SpecialEvent(params)

        assert specialEvent.save() != null
        assert SpecialEvent.count() == 1

        params.id = specialEvent.id

        controller.delete()

        assert SpecialEvent.count() == 0
        assert SpecialEvent.get(specialEvent.id) == null
        assert response.redirectedUrl == '/specialEvent/list'
    }
}
