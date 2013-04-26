package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(SubSubCollectionController)
@Mock(SubSubCollection)
class SubSubCollectionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subSubCollection/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subSubCollectionInstanceList.size() == 0
        assert model.subSubCollectionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.subSubCollectionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subSubCollectionInstance != null
        assert view == '/subSubCollection/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subSubCollection/show/1'
        assert controller.flash.message != null
        assert SubSubCollection.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subSubCollection/list'


        populateValidParams(params)
        def subSubCollection = new SubSubCollection(params)

        assert subSubCollection.save() != null

        params.id = subSubCollection.id

        def model = controller.show()

        assert model.subSubCollectionInstance == subSubCollection
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subSubCollection/list'


        populateValidParams(params)
        def subSubCollection = new SubSubCollection(params)

        assert subSubCollection.save() != null

        params.id = subSubCollection.id

        def model = controller.edit()

        assert model.subSubCollectionInstance == subSubCollection
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subSubCollection/list'

        response.reset()


        populateValidParams(params)
        def subSubCollection = new SubSubCollection(params)

        assert subSubCollection.save() != null

        // test invalid parameters in update
        params.id = subSubCollection.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subSubCollection/edit"
        assert model.subSubCollectionInstance != null

        subSubCollection.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subSubCollection/show/$subSubCollection.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subSubCollection.clearErrors()

        populateValidParams(params)
        params.id = subSubCollection.id
        params.version = -1
        controller.update()

        assert view == "/subSubCollection/edit"
        assert model.subSubCollectionInstance != null
        assert model.subSubCollectionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subSubCollection/list'

        response.reset()

        populateValidParams(params)
        def subSubCollection = new SubSubCollection(params)

        assert subSubCollection.save() != null
        assert SubSubCollection.count() == 1

        params.id = subSubCollection.id

        controller.delete()

        assert SubSubCollection.count() == 0
        assert SubSubCollection.get(subSubCollection.id) == null
        assert response.redirectedUrl == '/subSubCollection/list'
    }
}
