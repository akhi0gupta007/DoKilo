package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Header_logoController)
@Mock(Header_logo)
class Header_logoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/header_logo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.header_logoInstanceList.size() == 0
        assert model.header_logoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.header_logoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.header_logoInstance != null
        assert view == '/header_logo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/header_logo/show/1'
        assert controller.flash.message != null
        assert Header_logo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/header_logo/list'


        populateValidParams(params)
        def header_logo = new Header_logo(params)

        assert header_logo.save() != null

        params.id = header_logo.id

        def model = controller.show()

        assert model.header_logoInstance == header_logo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/header_logo/list'


        populateValidParams(params)
        def header_logo = new Header_logo(params)

        assert header_logo.save() != null

        params.id = header_logo.id

        def model = controller.edit()

        assert model.header_logoInstance == header_logo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/header_logo/list'

        response.reset()


        populateValidParams(params)
        def header_logo = new Header_logo(params)

        assert header_logo.save() != null

        // test invalid parameters in update
        params.id = header_logo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/header_logo/edit"
        assert model.header_logoInstance != null

        header_logo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/header_logo/show/$header_logo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        header_logo.clearErrors()

        populateValidParams(params)
        params.id = header_logo.id
        params.version = -1
        controller.update()

        assert view == "/header_logo/edit"
        assert model.header_logoInstance != null
        assert model.header_logoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/header_logo/list'

        response.reset()

        populateValidParams(params)
        def header_logo = new Header_logo(params)

        assert header_logo.save() != null
        assert Header_logo.count() == 1

        params.id = header_logo.id

        controller.delete()

        assert Header_logo.count() == 0
        assert Header_logo.get(header_logo.id) == null
        assert response.redirectedUrl == '/header_logo/list'
    }
}
