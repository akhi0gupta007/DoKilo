package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Product_gridController)
@Mock(Product_grid)
class Product_gridControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/product_grid/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.product_gridInstanceList.size() == 0
        assert model.product_gridInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.product_gridInstance != null
    }

    void testSave() {
        controller.save()

        assert model.product_gridInstance != null
        assert view == '/product_grid/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/product_grid/show/1'
        assert controller.flash.message != null
        assert Product_grid.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/product_grid/list'


        populateValidParams(params)
        def product_grid = new Product_grid(params)

        assert product_grid.save() != null

        params.id = product_grid.id

        def model = controller.show()

        assert model.product_gridInstance == product_grid
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/product_grid/list'


        populateValidParams(params)
        def product_grid = new Product_grid(params)

        assert product_grid.save() != null

        params.id = product_grid.id

        def model = controller.edit()

        assert model.product_gridInstance == product_grid
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/product_grid/list'

        response.reset()


        populateValidParams(params)
        def product_grid = new Product_grid(params)

        assert product_grid.save() != null

        // test invalid parameters in update
        params.id = product_grid.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/product_grid/edit"
        assert model.product_gridInstance != null

        product_grid.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/product_grid/show/$product_grid.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        product_grid.clearErrors()

        populateValidParams(params)
        params.id = product_grid.id
        params.version = -1
        controller.update()

        assert view == "/product_grid/edit"
        assert model.product_gridInstance != null
        assert model.product_gridInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/product_grid/list'

        response.reset()

        populateValidParams(params)
        def product_grid = new Product_grid(params)

        assert product_grid.save() != null
        assert Product_grid.count() == 1

        params.id = product_grid.id

        controller.delete()

        assert Product_grid.count() == 0
        assert Product_grid.get(product_grid.id) == null
        assert response.redirectedUrl == '/product_grid/list'
    }
}
