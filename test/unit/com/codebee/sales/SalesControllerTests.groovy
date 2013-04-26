package com.codebee.sales



import org.junit.*
import grails.test.mixin.*

@TestFor(SalesController)
@Mock(Sales)
class SalesControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sales/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.salesInstanceList.size() == 0
        assert model.salesInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.salesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.salesInstance != null
        assert view == '/sales/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sales/show/1'
        assert controller.flash.message != null
        assert Sales.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sales/list'


        populateValidParams(params)
        def sales = new Sales(params)

        assert sales.save() != null

        params.id = sales.id

        def model = controller.show()

        assert model.salesInstance == sales
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sales/list'


        populateValidParams(params)
        def sales = new Sales(params)

        assert sales.save() != null

        params.id = sales.id

        def model = controller.edit()

        assert model.salesInstance == sales
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sales/list'

        response.reset()


        populateValidParams(params)
        def sales = new Sales(params)

        assert sales.save() != null

        // test invalid parameters in update
        params.id = sales.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sales/edit"
        assert model.salesInstance != null

        sales.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sales/show/$sales.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sales.clearErrors()

        populateValidParams(params)
        params.id = sales.id
        params.version = -1
        controller.update()

        assert view == "/sales/edit"
        assert model.salesInstance != null
        assert model.salesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sales/list'

        response.reset()

        populateValidParams(params)
        def sales = new Sales(params)

        assert sales.save() != null
        assert Sales.count() == 1

        params.id = sales.id

        controller.delete()

        assert Sales.count() == 0
        assert Sales.get(sales.id) == null
        assert response.redirectedUrl == '/sales/list'
    }
}
