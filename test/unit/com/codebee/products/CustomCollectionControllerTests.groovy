package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(CustomCollectionController)
@Mock(CustomCollection)
class CustomCollectionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/customCollection/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.customCollectionInstanceList.size() == 0
        assert model.customCollectionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.customCollectionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.customCollectionInstance != null
        assert view == '/customCollection/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/customCollection/show/1'
        assert controller.flash.message != null
        assert CustomCollection.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/customCollection/list'


        populateValidParams(params)
        def customCollection = new CustomCollection(params)

        assert customCollection.save() != null

        params.id = customCollection.id

        def model = controller.show()

        assert model.customCollectionInstance == customCollection
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/customCollection/list'


        populateValidParams(params)
        def customCollection = new CustomCollection(params)

        assert customCollection.save() != null

        params.id = customCollection.id

        def model = controller.edit()

        assert model.customCollectionInstance == customCollection
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/customCollection/list'

        response.reset()


        populateValidParams(params)
        def customCollection = new CustomCollection(params)

        assert customCollection.save() != null

        // test invalid parameters in update
        params.id = customCollection.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/customCollection/edit"
        assert model.customCollectionInstance != null

        customCollection.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/customCollection/show/$customCollection.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        customCollection.clearErrors()

        populateValidParams(params)
        params.id = customCollection.id
        params.version = -1
        controller.update()

        assert view == "/customCollection/edit"
        assert model.customCollectionInstance != null
        assert model.customCollectionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/customCollection/list'

        response.reset()

        populateValidParams(params)
        def customCollection = new CustomCollection(params)

        assert customCollection.save() != null
        assert CustomCollection.count() == 1

        params.id = customCollection.id

        controller.delete()

        assert CustomCollection.count() == 0
        assert CustomCollection.get(customCollection.id) == null
        assert response.redirectedUrl == '/customCollection/list'
    }
}
