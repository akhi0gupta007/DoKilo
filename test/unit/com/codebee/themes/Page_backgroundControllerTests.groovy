package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Page_backgroundController)
@Mock(Page_background)
class Page_backgroundControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/page_background/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.page_backgroundInstanceList.size() == 0
        assert model.page_backgroundInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.page_backgroundInstance != null
    }

    void testSave() {
        controller.save()

        assert model.page_backgroundInstance != null
        assert view == '/page_background/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/page_background/show/1'
        assert controller.flash.message != null
        assert Page_background.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/page_background/list'


        populateValidParams(params)
        def page_background = new Page_background(params)

        assert page_background.save() != null

        params.id = page_background.id

        def model = controller.show()

        assert model.page_backgroundInstance == page_background
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/page_background/list'


        populateValidParams(params)
        def page_background = new Page_background(params)

        assert page_background.save() != null

        params.id = page_background.id

        def model = controller.edit()

        assert model.page_backgroundInstance == page_background
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/page_background/list'

        response.reset()


        populateValidParams(params)
        def page_background = new Page_background(params)

        assert page_background.save() != null

        // test invalid parameters in update
        params.id = page_background.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/page_background/edit"
        assert model.page_backgroundInstance != null

        page_background.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/page_background/show/$page_background.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        page_background.clearErrors()

        populateValidParams(params)
        params.id = page_background.id
        params.version = -1
        controller.update()

        assert view == "/page_background/edit"
        assert model.page_backgroundInstance != null
        assert model.page_backgroundInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/page_background/list'

        response.reset()

        populateValidParams(params)
        def page_background = new Page_background(params)

        assert page_background.save() != null
        assert Page_background.count() == 1

        params.id = page_background.id

        controller.delete()

        assert Page_background.count() == 0
        assert Page_background.get(page_background.id) == null
        assert response.redirectedUrl == '/page_background/list'
    }
}
