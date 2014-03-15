package entities



import org.junit.*
import grails.test.mixin.*

@TestFor(ModelProductController)
@Mock(ModelProduct)
class ModelProductControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/modelProduct/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.modelProductInstanceList.size() == 0
        assert model.modelProductInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.modelProductInstance != null
    }

    void testSave() {
        controller.save()

        assert model.modelProductInstance != null
        assert view == '/modelProduct/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/modelProduct/show/1'
        assert controller.flash.message != null
        assert ModelProduct.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/modelProduct/list'

        populateValidParams(params)
        def modelProduct = new ModelProduct(params)

        assert modelProduct.save() != null

        params.id = modelProduct.id

        def model = controller.show()

        assert model.modelProductInstance == modelProduct
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/modelProduct/list'

        populateValidParams(params)
        def modelProduct = new ModelProduct(params)

        assert modelProduct.save() != null

        params.id = modelProduct.id

        def model = controller.edit()

        assert model.modelProductInstance == modelProduct
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/modelProduct/list'

        response.reset()

        populateValidParams(params)
        def modelProduct = new ModelProduct(params)

        assert modelProduct.save() != null

        // test invalid parameters in update
        params.id = modelProduct.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/modelProduct/edit"
        assert model.modelProductInstance != null

        modelProduct.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/modelProduct/show/$modelProduct.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        modelProduct.clearErrors()

        populateValidParams(params)
        params.id = modelProduct.id
        params.version = -1
        controller.update()

        assert view == "/modelProduct/edit"
        assert model.modelProductInstance != null
        assert model.modelProductInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/modelProduct/list'

        response.reset()

        populateValidParams(params)
        def modelProduct = new ModelProduct(params)

        assert modelProduct.save() != null
        assert ModelProduct.count() == 1

        params.id = modelProduct.id

        controller.delete()

        assert ModelProduct.count() == 0
        assert ModelProduct.get(modelProduct.id) == null
        assert response.redirectedUrl == '/modelProduct/list'
    }
}
