package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Header_navController)
@Mock(Header_nav)
class Header_navControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/header_nav/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.header_navInstanceList.size() == 0
        assert model.header_navInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.header_navInstance != null
    }

    void testSave() {
        controller.save()

        assert model.header_navInstance != null
        assert view == '/header_nav/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/header_nav/show/1'
        assert controller.flash.message != null
        assert Header_nav.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/header_nav/list'


        populateValidParams(params)
        def header_nav = new Header_nav(params)

        assert header_nav.save() != null

        params.id = header_nav.id

        def model = controller.show()

        assert model.header_navInstance == header_nav
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/header_nav/list'


        populateValidParams(params)
        def header_nav = new Header_nav(params)

        assert header_nav.save() != null

        params.id = header_nav.id

        def model = controller.edit()

        assert model.header_navInstance == header_nav
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/header_nav/list'

        response.reset()


        populateValidParams(params)
        def header_nav = new Header_nav(params)

        assert header_nav.save() != null

        // test invalid parameters in update
        params.id = header_nav.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/header_nav/edit"
        assert model.header_navInstance != null

        header_nav.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/header_nav/show/$header_nav.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        header_nav.clearErrors()

        populateValidParams(params)
        params.id = header_nav.id
        params.version = -1
        controller.update()

        assert view == "/header_nav/edit"
        assert model.header_navInstance != null
        assert model.header_navInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/header_nav/list'

        response.reset()

        populateValidParams(params)
        def header_nav = new Header_nav(params)

        assert header_nav.save() != null
        assert Header_nav.count() == 1

        params.id = header_nav.id

        controller.delete()

        assert Header_nav.count() == 0
        assert Header_nav.get(header_nav.id) == null
        assert response.redirectedUrl == '/header_nav/list'
    }
}
