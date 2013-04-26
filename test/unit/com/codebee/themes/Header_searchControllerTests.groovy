package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Header_searchController)
@Mock(Header_search)
class Header_searchControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/header_search/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.header_searchInstanceList.size() == 0
        assert model.header_searchInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.header_searchInstance != null
    }

    void testSave() {
        controller.save()

        assert model.header_searchInstance != null
        assert view == '/header_search/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/header_search/show/1'
        assert controller.flash.message != null
        assert Header_search.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/header_search/list'


        populateValidParams(params)
        def header_search = new Header_search(params)

        assert header_search.save() != null

        params.id = header_search.id

        def model = controller.show()

        assert model.header_searchInstance == header_search
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/header_search/list'


        populateValidParams(params)
        def header_search = new Header_search(params)

        assert header_search.save() != null

        params.id = header_search.id

        def model = controller.edit()

        assert model.header_searchInstance == header_search
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/header_search/list'

        response.reset()


        populateValidParams(params)
        def header_search = new Header_search(params)

        assert header_search.save() != null

        // test invalid parameters in update
        params.id = header_search.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/header_search/edit"
        assert model.header_searchInstance != null

        header_search.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/header_search/show/$header_search.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        header_search.clearErrors()

        populateValidParams(params)
        params.id = header_search.id
        params.version = -1
        controller.update()

        assert view == "/header_search/edit"
        assert model.header_searchInstance != null
        assert model.header_searchInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/header_search/list'

        response.reset()

        populateValidParams(params)
        def header_search = new Header_search(params)

        assert header_search.save() != null
        assert Header_search.count() == 1

        params.id = header_search.id

        controller.delete()

        assert Header_search.count() == 0
        assert Header_search.get(header_search.id) == null
        assert response.redirectedUrl == '/header_search/list'
    }
}
