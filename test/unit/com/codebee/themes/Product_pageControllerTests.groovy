package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Product_pageController)
@Mock(Product_page)
class Product_pageControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/product_page/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.product_pageInstanceList.size() == 0
        assert model.product_pageInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.product_pageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.product_pageInstance != null
        assert view == '/product_page/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/product_page/show/1'
        assert controller.flash.message != null
        assert Product_page.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/product_page/list'


        populateValidParams(params)
        def product_page = new Product_page(params)

        assert product_page.save() != null

        params.id = product_page.id

        def model = controller.show()

        assert model.product_pageInstance == product_page
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/product_page/list'


        populateValidParams(params)
        def product_page = new Product_page(params)

        assert product_page.save() != null

        params.id = product_page.id

        def model = controller.edit()

        assert model.product_pageInstance == product_page
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/product_page/list'

        response.reset()


        populateValidParams(params)
        def product_page = new Product_page(params)

        assert product_page.save() != null

        // test invalid parameters in update
        params.id = product_page.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/product_page/edit"
        assert model.product_pageInstance != null

        product_page.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/product_page/show/$product_page.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        product_page.clearErrors()

        populateValidParams(params)
        params.id = product_page.id
        params.version = -1
        controller.update()

        assert view == "/product_page/edit"
        assert model.product_pageInstance != null
        assert model.product_pageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/product_page/list'

        response.reset()

        populateValidParams(params)
        def product_page = new Product_page(params)

        assert product_page.save() != null
        assert Product_page.count() == 1

        params.id = product_page.id

        controller.delete()

        assert Product_page.count() == 0
        assert Product_page.get(product_page.id) == null
        assert response.redirectedUrl == '/product_page/list'
    }
}
