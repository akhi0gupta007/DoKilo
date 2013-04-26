package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(HomepageController)
@Mock(Homepage)
class HomepageControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/homepage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.homepageInstanceList.size() == 0
        assert model.homepageInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.homepageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.homepageInstance != null
        assert view == '/homepage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/homepage/show/1'
        assert controller.flash.message != null
        assert Homepage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/homepage/list'


        populateValidParams(params)
        def homepage = new Homepage(params)

        assert homepage.save() != null

        params.id = homepage.id

        def model = controller.show()

        assert model.homepageInstance == homepage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/homepage/list'


        populateValidParams(params)
        def homepage = new Homepage(params)

        assert homepage.save() != null

        params.id = homepage.id

        def model = controller.edit()

        assert model.homepageInstance == homepage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/homepage/list'

        response.reset()


        populateValidParams(params)
        def homepage = new Homepage(params)

        assert homepage.save() != null

        // test invalid parameters in update
        params.id = homepage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/homepage/edit"
        assert model.homepageInstance != null

        homepage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/homepage/show/$homepage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        homepage.clearErrors()

        populateValidParams(params)
        params.id = homepage.id
        params.version = -1
        controller.update()

        assert view == "/homepage/edit"
        assert model.homepageInstance != null
        assert model.homepageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/homepage/list'

        response.reset()

        populateValidParams(params)
        def homepage = new Homepage(params)

        assert homepage.save() != null
        assert Homepage.count() == 1

        params.id = homepage.id

        controller.delete()

        assert Homepage.count() == 0
        assert Homepage.get(homepage.id) == null
        assert response.redirectedUrl == '/homepage/list'
    }
}
