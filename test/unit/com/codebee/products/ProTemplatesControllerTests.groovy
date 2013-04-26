package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(ProTemplatesController)
@Mock(ProTemplates)
class ProTemplatesControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/proTemplates/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.proTemplatesInstanceList.size() == 0
        assert model.proTemplatesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.proTemplatesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.proTemplatesInstance != null
        assert view == '/proTemplates/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/proTemplates/show/1'
        assert controller.flash.message != null
        assert ProTemplates.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/proTemplates/list'


        populateValidParams(params)
        def proTemplates = new ProTemplates(params)

        assert proTemplates.save() != null

        params.id = proTemplates.id

        def model = controller.show()

        assert model.proTemplatesInstance == proTemplates
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/proTemplates/list'


        populateValidParams(params)
        def proTemplates = new ProTemplates(params)

        assert proTemplates.save() != null

        params.id = proTemplates.id

        def model = controller.edit()

        assert model.proTemplatesInstance == proTemplates
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/proTemplates/list'

        response.reset()


        populateValidParams(params)
        def proTemplates = new ProTemplates(params)

        assert proTemplates.save() != null

        // test invalid parameters in update
        params.id = proTemplates.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/proTemplates/edit"
        assert model.proTemplatesInstance != null

        proTemplates.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/proTemplates/show/$proTemplates.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        proTemplates.clearErrors()

        populateValidParams(params)
        params.id = proTemplates.id
        params.version = -1
        controller.update()

        assert view == "/proTemplates/edit"
        assert model.proTemplatesInstance != null
        assert model.proTemplatesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/proTemplates/list'

        response.reset()

        populateValidParams(params)
        def proTemplates = new ProTemplates(params)

        assert proTemplates.save() != null
        assert ProTemplates.count() == 1

        params.id = proTemplates.id

        controller.delete()

        assert ProTemplates.count() == 0
        assert ProTemplates.get(proTemplates.id) == null
        assert response.redirectedUrl == '/proTemplates/list'
    }
}
