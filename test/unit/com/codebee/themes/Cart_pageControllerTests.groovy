package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Cart_pageController)
@Mock(Cart_page)
class Cart_pageControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cart_page/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cart_pageInstanceList.size() == 0
        assert model.cart_pageInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.cart_pageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cart_pageInstance != null
        assert view == '/cart_page/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cart_page/show/1'
        assert controller.flash.message != null
        assert Cart_page.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cart_page/list'


        populateValidParams(params)
        def cart_page = new Cart_page(params)

        assert cart_page.save() != null

        params.id = cart_page.id

        def model = controller.show()

        assert model.cart_pageInstance == cart_page
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cart_page/list'


        populateValidParams(params)
        def cart_page = new Cart_page(params)

        assert cart_page.save() != null

        params.id = cart_page.id

        def model = controller.edit()

        assert model.cart_pageInstance == cart_page
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cart_page/list'

        response.reset()


        populateValidParams(params)
        def cart_page = new Cart_page(params)

        assert cart_page.save() != null

        // test invalid parameters in update
        params.id = cart_page.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cart_page/edit"
        assert model.cart_pageInstance != null

        cart_page.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cart_page/show/$cart_page.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cart_page.clearErrors()

        populateValidParams(params)
        params.id = cart_page.id
        params.version = -1
        controller.update()

        assert view == "/cart_page/edit"
        assert model.cart_pageInstance != null
        assert model.cart_pageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cart_page/list'

        response.reset()

        populateValidParams(params)
        def cart_page = new Cart_page(params)

        assert cart_page.save() != null
        assert Cart_page.count() == 1

        params.id = cart_page.id

        controller.delete()

        assert Cart_page.count() == 0
        assert Cart_page.get(cart_page.id) == null
        assert response.redirectedUrl == '/cart_page/list'
    }
}
