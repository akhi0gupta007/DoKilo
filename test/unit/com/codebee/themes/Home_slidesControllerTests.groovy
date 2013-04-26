package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Home_slidesController)
@Mock(Home_slides)
class Home_slidesControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/home_slides/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.home_slidesInstanceList.size() == 0
        assert model.home_slidesInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.home_slidesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.home_slidesInstance != null
        assert view == '/home_slides/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/home_slides/show/1'
        assert controller.flash.message != null
        assert Home_slides.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/home_slides/list'


        populateValidParams(params)
        def home_slides = new Home_slides(params)

        assert home_slides.save() != null

        params.id = home_slides.id

        def model = controller.show()

        assert model.home_slidesInstance == home_slides
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/home_slides/list'


        populateValidParams(params)
        def home_slides = new Home_slides(params)

        assert home_slides.save() != null

        params.id = home_slides.id

        def model = controller.edit()

        assert model.home_slidesInstance == home_slides
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/home_slides/list'

        response.reset()


        populateValidParams(params)
        def home_slides = new Home_slides(params)

        assert home_slides.save() != null

        // test invalid parameters in update
        params.id = home_slides.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/home_slides/edit"
        assert model.home_slidesInstance != null

        home_slides.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/home_slides/show/$home_slides.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        home_slides.clearErrors()

        populateValidParams(params)
        params.id = home_slides.id
        params.version = -1
        controller.update()

        assert view == "/home_slides/edit"
        assert model.home_slidesInstance != null
        assert model.home_slidesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/home_slides/list'

        response.reset()

        populateValidParams(params)
        def home_slides = new Home_slides(params)

        assert home_slides.save() != null
        assert Home_slides.count() == 1

        params.id = home_slides.id

        controller.delete()

        assert Home_slides.count() == 0
        assert Home_slides.get(home_slides.id) == null
        assert response.redirectedUrl == '/home_slides/list'
    }
}
