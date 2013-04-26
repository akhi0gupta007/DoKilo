package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(CustomVariantController)
@Mock(CustomVariant)
class CustomVariantControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/customVariant/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.customVariantInstanceList.size() == 0
        assert model.customVariantInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.customVariantInstance != null
    }

    void testSave() {
        controller.save()

        assert model.customVariantInstance != null
        assert view == '/customVariant/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/customVariant/show/1'
        assert controller.flash.message != null
        assert CustomVariant.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/customVariant/list'


        populateValidParams(params)
        def customVariant = new CustomVariant(params)

        assert customVariant.save() != null

        params.id = customVariant.id

        def model = controller.show()

        assert model.customVariantInstance == customVariant
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/customVariant/list'


        populateValidParams(params)
        def customVariant = new CustomVariant(params)

        assert customVariant.save() != null

        params.id = customVariant.id

        def model = controller.edit()

        assert model.customVariantInstance == customVariant
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/customVariant/list'

        response.reset()


        populateValidParams(params)
        def customVariant = new CustomVariant(params)

        assert customVariant.save() != null

        // test invalid parameters in update
        params.id = customVariant.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/customVariant/edit"
        assert model.customVariantInstance != null

        customVariant.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/customVariant/show/$customVariant.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        customVariant.clearErrors()

        populateValidParams(params)
        params.id = customVariant.id
        params.version = -1
        controller.update()

        assert view == "/customVariant/edit"
        assert model.customVariantInstance != null
        assert model.customVariantInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/customVariant/list'

        response.reset()

        populateValidParams(params)
        def customVariant = new CustomVariant(params)

        assert customVariant.save() != null
        assert CustomVariant.count() == 1

        params.id = customVariant.id

        controller.delete()

        assert CustomVariant.count() == 0
        assert CustomVariant.get(customVariant.id) == null
        assert response.redirectedUrl == '/customVariant/list'
    }
}
