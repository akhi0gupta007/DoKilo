package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(TemplatesController)
@Mock(Templates)
class TemplatesControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/templates/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.templatesInstanceList.size() == 0
        assert model.templatesInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.templatesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.templatesInstance != null
        assert view == '/templates/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/templates/show/1'
        assert controller.flash.message != null
        assert Templates.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/templates/list'


        populateValidParams(params)
        def templates = new Templates(params)

        assert templates.save() != null

        params.id = templates.id

        def model = controller.show()

        assert model.templatesInstance == templates
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/templates/list'


        populateValidParams(params)
        def templates = new Templates(params)

        assert templates.save() != null

        params.id = templates.id

        def model = controller.edit()

        assert model.templatesInstance == templates
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/templates/list'

        response.reset()


        populateValidParams(params)
        def templates = new Templates(params)

        assert templates.save() != null

        // test invalid parameters in update
        params.id = templates.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/templates/edit"
        assert model.templatesInstance != null

        templates.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/templates/show/$templates.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        templates.clearErrors()

        populateValidParams(params)
        params.id = templates.id
        params.version = -1
        controller.update()

        assert view == "/templates/edit"
        assert model.templatesInstance != null
        assert model.templatesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/templates/list'

        response.reset()

        populateValidParams(params)
        def templates = new Templates(params)

        assert templates.save() != null
        assert Templates.count() == 1

        params.id = templates.id

        controller.delete()

        assert Templates.count() == 0
        assert Templates.get(templates.id) == null
        assert response.redirectedUrl == '/templates/list'
    }
}
