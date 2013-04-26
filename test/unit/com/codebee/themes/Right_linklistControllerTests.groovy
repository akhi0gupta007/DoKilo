package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Right_linklistController)
@Mock(Right_linklist)
class Right_linklistControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/right_linklist/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.right_linklistInstanceList.size() == 0
        assert model.right_linklistInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.right_linklistInstance != null
    }

    void testSave() {
        controller.save()

        assert model.right_linklistInstance != null
        assert view == '/right_linklist/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/right_linklist/show/1'
        assert controller.flash.message != null
        assert Right_linklist.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/right_linklist/list'


        populateValidParams(params)
        def right_linklist = new Right_linklist(params)

        assert right_linklist.save() != null

        params.id = right_linklist.id

        def model = controller.show()

        assert model.right_linklistInstance == right_linklist
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/right_linklist/list'


        populateValidParams(params)
        def right_linklist = new Right_linklist(params)

        assert right_linklist.save() != null

        params.id = right_linklist.id

        def model = controller.edit()

        assert model.right_linklistInstance == right_linklist
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/right_linklist/list'

        response.reset()


        populateValidParams(params)
        def right_linklist = new Right_linklist(params)

        assert right_linklist.save() != null

        // test invalid parameters in update
        params.id = right_linklist.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/right_linklist/edit"
        assert model.right_linklistInstance != null

        right_linklist.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/right_linklist/show/$right_linklist.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        right_linklist.clearErrors()

        populateValidParams(params)
        params.id = right_linklist.id
        params.version = -1
        controller.update()

        assert view == "/right_linklist/edit"
        assert model.right_linklistInstance != null
        assert model.right_linklistInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/right_linklist/list'

        response.reset()

        populateValidParams(params)
        def right_linklist = new Right_linklist(params)

        assert right_linklist.save() != null
        assert Right_linklist.count() == 1

        params.id = right_linklist.id

        controller.delete()

        assert Right_linklist.count() == 0
        assert Right_linklist.get(right_linklist.id) == null
        assert response.redirectedUrl == '/right_linklist/list'
    }
}
