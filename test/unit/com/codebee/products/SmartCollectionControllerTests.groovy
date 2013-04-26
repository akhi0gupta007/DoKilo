package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(SmartCollectionController)
@Mock(SmartCollection)
class SmartCollectionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/smartCollection/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.smartCollectionInstanceList.size() == 0
        assert model.smartCollectionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.smartCollectionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.smartCollectionInstance != null
        assert view == '/smartCollection/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/smartCollection/show/1'
        assert controller.flash.message != null
        assert SmartCollection.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/smartCollection/list'


        populateValidParams(params)
        def smartCollection = new SmartCollection(params)

        assert smartCollection.save() != null

        params.id = smartCollection.id

        def model = controller.show()

        assert model.smartCollectionInstance == smartCollection
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/smartCollection/list'


        populateValidParams(params)
        def smartCollection = new SmartCollection(params)

        assert smartCollection.save() != null

        params.id = smartCollection.id

        def model = controller.edit()

        assert model.smartCollectionInstance == smartCollection
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/smartCollection/list'

        response.reset()


        populateValidParams(params)
        def smartCollection = new SmartCollection(params)

        assert smartCollection.save() != null

        // test invalid parameters in update
        params.id = smartCollection.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/smartCollection/edit"
        assert model.smartCollectionInstance != null

        smartCollection.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/smartCollection/show/$smartCollection.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        smartCollection.clearErrors()

        populateValidParams(params)
        params.id = smartCollection.id
        params.version = -1
        controller.update()

        assert view == "/smartCollection/edit"
        assert model.smartCollectionInstance != null
        assert model.smartCollectionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/smartCollection/list'

        response.reset()

        populateValidParams(params)
        def smartCollection = new SmartCollection(params)

        assert smartCollection.save() != null
        assert SmartCollection.count() == 1

        params.id = smartCollection.id

        controller.delete()

        assert SmartCollection.count() == 0
        assert SmartCollection.get(smartCollection.id) == null
        assert response.redirectedUrl == '/smartCollection/list'
    }
}
