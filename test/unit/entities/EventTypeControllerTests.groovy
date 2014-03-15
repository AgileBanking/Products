package entities



import org.junit.*
import grails.test.mixin.*

@TestFor(EventTypeController)
@Mock(EventType)
class EventTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/eventType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.eventTypeInstanceList.size() == 0
        assert model.eventTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.eventTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.eventTypeInstance != null
        assert view == '/eventType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/eventType/show/1'
        assert controller.flash.message != null
        assert EventType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/eventType/list'

        populateValidParams(params)
        def eventType = new EventType(params)

        assert eventType.save() != null

        params.id = eventType.id

        def model = controller.show()

        assert model.eventTypeInstance == eventType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/eventType/list'

        populateValidParams(params)
        def eventType = new EventType(params)

        assert eventType.save() != null

        params.id = eventType.id

        def model = controller.edit()

        assert model.eventTypeInstance == eventType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/eventType/list'

        response.reset()

        populateValidParams(params)
        def eventType = new EventType(params)

        assert eventType.save() != null

        // test invalid parameters in update
        params.id = eventType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/eventType/edit"
        assert model.eventTypeInstance != null

        eventType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/eventType/show/$eventType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        eventType.clearErrors()

        populateValidParams(params)
        params.id = eventType.id
        params.version = -1
        controller.update()

        assert view == "/eventType/edit"
        assert model.eventTypeInstance != null
        assert model.eventTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/eventType/list'

        response.reset()

        populateValidParams(params)
        def eventType = new EventType(params)

        assert eventType.save() != null
        assert EventType.count() == 1

        params.id = eventType.id

        controller.delete()

        assert EventType.count() == 0
        assert EventType.get(eventType.id) == null
        assert response.redirectedUrl == '/eventType/list'
    }
}
