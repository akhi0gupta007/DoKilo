package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(SubCollectionController)
@Mock(SubCollection)
class SubCollectionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subCollection/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subCollectionInstanceList.size() == 0
        assert model.subCollectionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.subCollectionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subCollectionInstance != null
        assert view == '/subCollection/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subCollection/show/1'
        assert controller.flash.message != null
        assert SubCollection.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subCollection/list'


        populateValidParams(params)
        def subCollection = new SubCollection(params)

        assert subCollection.save() != null

        params.id = subCollection.id

        def model = controller.show()

        assert model.subCollectionInstance == subCollection
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subCollection/list'


        populateValidParams(params)
        def subCollection = new SubCollection(params)

        assert subCollection.save() != null

        params.id = subCollection.id

        def model = controller.edit()

        assert model.subCollectionInstance == subCollection
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subCollection/list'

        response.reset()


        populateValidParams(params)
        def subCollection = new SubCollection(params)

        assert subCollection.save() != null

        // test invalid parameters in update
        params.id = subCollection.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subCollection/edit"
        assert model.subCollectionInstance != null

        subCollection.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subCollection/show/$subCollection.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subCollection.clearErrors()

        populateValidParams(params)
        params.id = subCollection.id
        params.version = -1
        controller.update()

        assert view == "/subCollection/edit"
        assert model.subCollectionInstance != null
        assert model.subCollectionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subCollection/list'

        response.reset()

        populateValidParams(params)
        def subCollection = new SubCollection(params)

        assert subCollection.save() != null
        assert SubCollection.count() == 1

        params.id = subCollection.id

        controller.delete()

        assert SubCollection.count() == 0
        assert SubCollection.get(subCollection.id) == null
        assert response.redirectedUrl == '/subCollection/list'
    }
}
