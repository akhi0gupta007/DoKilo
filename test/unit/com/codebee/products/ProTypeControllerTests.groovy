package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(ProTypeController)
@Mock(ProType)
class ProTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/proType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.proTypeInstanceList.size() == 0
        assert model.proTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.proTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.proTypeInstance != null
        assert view == '/proType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/proType/show/1'
        assert controller.flash.message != null
        assert ProType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/proType/list'


        populateValidParams(params)
        def proType = new ProType(params)

        assert proType.save() != null

        params.id = proType.id

        def model = controller.show()

        assert model.proTypeInstance == proType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/proType/list'


        populateValidParams(params)
        def proType = new ProType(params)

        assert proType.save() != null

        params.id = proType.id

        def model = controller.edit()

        assert model.proTypeInstance == proType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/proType/list'

        response.reset()


        populateValidParams(params)
        def proType = new ProType(params)

        assert proType.save() != null

        // test invalid parameters in update
        params.id = proType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/proType/edit"
        assert model.proTypeInstance != null

        proType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/proType/show/$proType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        proType.clearErrors()

        populateValidParams(params)
        params.id = proType.id
        params.version = -1
        controller.update()

        assert view == "/proType/edit"
        assert model.proTypeInstance != null
        assert model.proTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/proType/list'

        response.reset()

        populateValidParams(params)
        def proType = new ProType(params)

        assert proType.save() != null
        assert ProType.count() == 1

        params.id = proType.id

        controller.delete()

        assert ProType.count() == 0
        assert ProType.get(proType.id) == null
        assert response.redirectedUrl == '/proType/list'
    }
}
