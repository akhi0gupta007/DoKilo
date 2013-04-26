package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Right_welcomeController)
@Mock(Right_welcome)
class Right_welcomeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/right_welcome/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.right_welcomeInstanceList.size() == 0
        assert model.right_welcomeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.right_welcomeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.right_welcomeInstance != null
        assert view == '/right_welcome/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/right_welcome/show/1'
        assert controller.flash.message != null
        assert Right_welcome.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/right_welcome/list'


        populateValidParams(params)
        def right_welcome = new Right_welcome(params)

        assert right_welcome.save() != null

        params.id = right_welcome.id

        def model = controller.show()

        assert model.right_welcomeInstance == right_welcome
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/right_welcome/list'


        populateValidParams(params)
        def right_welcome = new Right_welcome(params)

        assert right_welcome.save() != null

        params.id = right_welcome.id

        def model = controller.edit()

        assert model.right_welcomeInstance == right_welcome
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/right_welcome/list'

        response.reset()


        populateValidParams(params)
        def right_welcome = new Right_welcome(params)

        assert right_welcome.save() != null

        // test invalid parameters in update
        params.id = right_welcome.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/right_welcome/edit"
        assert model.right_welcomeInstance != null

        right_welcome.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/right_welcome/show/$right_welcome.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        right_welcome.clearErrors()

        populateValidParams(params)
        params.id = right_welcome.id
        params.version = -1
        controller.update()

        assert view == "/right_welcome/edit"
        assert model.right_welcomeInstance != null
        assert model.right_welcomeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/right_welcome/list'

        response.reset()

        populateValidParams(params)
        def right_welcome = new Right_welcome(params)

        assert right_welcome.save() != null
        assert Right_welcome.count() == 1

        params.id = right_welcome.id

        controller.delete()

        assert Right_welcome.count() == 0
        assert Right_welcome.get(right_welcome.id) == null
        assert response.redirectedUrl == '/right_welcome/list'
    }
}
