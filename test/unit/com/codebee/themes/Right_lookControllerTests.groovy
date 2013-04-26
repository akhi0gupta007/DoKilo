package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Right_lookController)
@Mock(Right_look)
class Right_lookControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/right_look/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.right_lookInstanceList.size() == 0
        assert model.right_lookInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.right_lookInstance != null
    }

    void testSave() {
        controller.save()

        assert model.right_lookInstance != null
        assert view == '/right_look/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/right_look/show/1'
        assert controller.flash.message != null
        assert Right_look.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/right_look/list'


        populateValidParams(params)
        def right_look = new Right_look(params)

        assert right_look.save() != null

        params.id = right_look.id

        def model = controller.show()

        assert model.right_lookInstance == right_look
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/right_look/list'


        populateValidParams(params)
        def right_look = new Right_look(params)

        assert right_look.save() != null

        params.id = right_look.id

        def model = controller.edit()

        assert model.right_lookInstance == right_look
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/right_look/list'

        response.reset()


        populateValidParams(params)
        def right_look = new Right_look(params)

        assert right_look.save() != null

        // test invalid parameters in update
        params.id = right_look.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/right_look/edit"
        assert model.right_lookInstance != null

        right_look.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/right_look/show/$right_look.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        right_look.clearErrors()

        populateValidParams(params)
        params.id = right_look.id
        params.version = -1
        controller.update()

        assert view == "/right_look/edit"
        assert model.right_lookInstance != null
        assert model.right_lookInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/right_look/list'

        response.reset()

        populateValidParams(params)
        def right_look = new Right_look(params)

        assert right_look.save() != null
        assert Right_look.count() == 1

        params.id = right_look.id

        controller.delete()

        assert Right_look.count() == 0
        assert Right_look.get(right_look.id) == null
        assert response.redirectedUrl == '/right_look/list'
    }
}
