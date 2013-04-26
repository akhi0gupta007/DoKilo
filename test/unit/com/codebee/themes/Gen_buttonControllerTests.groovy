package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Gen_buttonController)
@Mock(Gen_button)
class Gen_buttonControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gen_button/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gen_buttonInstanceList.size() == 0
        assert model.gen_buttonInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.gen_buttonInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gen_buttonInstance != null
        assert view == '/gen_button/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gen_button/show/1'
        assert controller.flash.message != null
        assert Gen_button.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_button/list'


        populateValidParams(params)
        def gen_button = new Gen_button(params)

        assert gen_button.save() != null

        params.id = gen_button.id

        def model = controller.show()

        assert model.gen_buttonInstance == gen_button
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_button/list'


        populateValidParams(params)
        def gen_button = new Gen_button(params)

        assert gen_button.save() != null

        params.id = gen_button.id

        def model = controller.edit()

        assert model.gen_buttonInstance == gen_button
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_button/list'

        response.reset()


        populateValidParams(params)
        def gen_button = new Gen_button(params)

        assert gen_button.save() != null

        // test invalid parameters in update
        params.id = gen_button.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gen_button/edit"
        assert model.gen_buttonInstance != null

        gen_button.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gen_button/show/$gen_button.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gen_button.clearErrors()

        populateValidParams(params)
        params.id = gen_button.id
        params.version = -1
        controller.update()

        assert view == "/gen_button/edit"
        assert model.gen_buttonInstance != null
        assert model.gen_buttonInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gen_button/list'

        response.reset()

        populateValidParams(params)
        def gen_button = new Gen_button(params)

        assert gen_button.save() != null
        assert Gen_button.count() == 1

        params.id = gen_button.id

        controller.delete()

        assert Gen_button.count() == 0
        assert Gen_button.get(gen_button.id) == null
        assert response.redirectedUrl == '/gen_button/list'
    }
}
