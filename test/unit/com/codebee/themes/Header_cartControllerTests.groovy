package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Header_cartController)
@Mock(Header_cart)
class Header_cartControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/header_cart/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.header_cartInstanceList.size() == 0
        assert model.header_cartInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.header_cartInstance != null
    }

    void testSave() {
        controller.save()

        assert model.header_cartInstance != null
        assert view == '/header_cart/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/header_cart/show/1'
        assert controller.flash.message != null
        assert Header_cart.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/header_cart/list'


        populateValidParams(params)
        def header_cart = new Header_cart(params)

        assert header_cart.save() != null

        params.id = header_cart.id

        def model = controller.show()

        assert model.header_cartInstance == header_cart
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/header_cart/list'


        populateValidParams(params)
        def header_cart = new Header_cart(params)

        assert header_cart.save() != null

        params.id = header_cart.id

        def model = controller.edit()

        assert model.header_cartInstance == header_cart
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/header_cart/list'

        response.reset()


        populateValidParams(params)
        def header_cart = new Header_cart(params)

        assert header_cart.save() != null

        // test invalid parameters in update
        params.id = header_cart.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/header_cart/edit"
        assert model.header_cartInstance != null

        header_cart.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/header_cart/show/$header_cart.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        header_cart.clearErrors()

        populateValidParams(params)
        params.id = header_cart.id
        params.version = -1
        controller.update()

        assert view == "/header_cart/edit"
        assert model.header_cartInstance != null
        assert model.header_cartInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/header_cart/list'

        response.reset()

        populateValidParams(params)
        def header_cart = new Header_cart(params)

        assert header_cart.save() != null
        assert Header_cart.count() == 1

        params.id = header_cart.id

        controller.delete()

        assert Header_cart.count() == 0
        assert Header_cart.get(header_cart.id) == null
        assert response.redirectedUrl == '/header_cart/list'
    }
}
