package entities



import org.junit.*
import grails.test.mixin.*

@TestFor(ModelEventController)
@Mock(ModelEvent)
class ModelEventControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/modelEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.modelEventInstanceList.size() == 0
        assert model.modelEventInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.modelEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.modelEventInstance != null
        assert view == '/modelEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/modelEvent/show/1'
        assert controller.flash.message != null
        assert ModelEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/modelEvent/list'

        populateValidParams(params)
        def modelEvent = new ModelEvent(params)

        assert modelEvent.save() != null

        params.id = modelEvent.id

        def model = controller.show()

        assert model.modelEventInstance == modelEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/modelEvent/list'

        populateValidParams(params)
        def modelEvent = new ModelEvent(params)

        assert modelEvent.save() != null

        params.id = modelEvent.id

        def model = controller.edit()

        assert model.modelEventInstance == modelEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/modelEvent/list'

        response.reset()

        populateValidParams(params)
        def modelEvent = new ModelEvent(params)

        assert modelEvent.save() != null

        // test invalid parameters in update
        params.id = modelEvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/modelEvent/edit"
        assert model.modelEventInstance != null

        modelEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/modelEvent/show/$modelEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        modelEvent.clearErrors()

        populateValidParams(params)
        params.id = modelEvent.id
        params.version = -1
        controller.update()

        assert view == "/modelEvent/edit"
        assert model.modelEventInstance != null
        assert model.modelEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/modelEvent/list'

        response.reset()

        populateValidParams(params)
        def modelEvent = new ModelEvent(params)

        assert modelEvent.save() != null
        assert ModelEvent.count() == 1

        params.id = modelEvent.id

        controller.delete()

        assert ModelEvent.count() == 0
        assert ModelEvent.get(modelEvent.id) == null
        assert response.redirectedUrl == '/modelEvent/list'
    }
}
