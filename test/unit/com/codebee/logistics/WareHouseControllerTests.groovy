package com.codebee.logistics



import org.junit.*
import grails.test.mixin.*

@TestFor(WareHouseController)
@Mock(WareHouse)
class WareHouseControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/wareHouse/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.wareHouseInstanceList.size() == 0
        assert model.wareHouseInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.wareHouseInstance != null
    }

    void testSave() {
        controller.save()

        assert model.wareHouseInstance != null
        assert view == '/wareHouse/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/wareHouse/show/1'
        assert controller.flash.message != null
        assert WareHouse.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/wareHouse/list'


        populateValidParams(params)
        def wareHouse = new WareHouse(params)

        assert wareHouse.save() != null

        params.id = wareHouse.id

        def model = controller.show()

        assert model.wareHouseInstance == wareHouse
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/wareHouse/list'


        populateValidParams(params)
        def wareHouse = new WareHouse(params)

        assert wareHouse.save() != null

        params.id = wareHouse.id

        def model = controller.edit()

        assert model.wareHouseInstance == wareHouse
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/wareHouse/list'

        response.reset()


        populateValidParams(params)
        def wareHouse = new WareHouse(params)

        assert wareHouse.save() != null

        // test invalid parameters in update
        params.id = wareHouse.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/wareHouse/edit"
        assert model.wareHouseInstance != null

        wareHouse.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/wareHouse/show/$wareHouse.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        wareHouse.clearErrors()

        populateValidParams(params)
        params.id = wareHouse.id
        params.version = -1
        controller.update()

        assert view == "/wareHouse/edit"
        assert model.wareHouseInstance != null
        assert model.wareHouseInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/wareHouse/list'

        response.reset()

        populateValidParams(params)
        def wareHouse = new WareHouse(params)

        assert wareHouse.save() != null
        assert WareHouse.count() == 1

        params.id = wareHouse.id

        controller.delete()

        assert WareHouse.count() == 0
        assert WareHouse.get(wareHouse.id) == null
        assert response.redirectedUrl == '/wareHouse/list'
    }
}
