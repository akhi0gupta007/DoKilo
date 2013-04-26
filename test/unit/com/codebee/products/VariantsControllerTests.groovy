package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(VariantsController)
@Mock(Variants)
class VariantsControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/variants/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.variantsInstanceList.size() == 0
        assert model.variantsInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.variantsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.variantsInstance != null
        assert view == '/variants/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/variants/show/1'
        assert controller.flash.message != null
        assert Variants.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/variants/list'


        populateValidParams(params)
        def variants = new Variants(params)

        assert variants.save() != null

        params.id = variants.id

        def model = controller.show()

        assert model.variantsInstance == variants
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/variants/list'


        populateValidParams(params)
        def variants = new Variants(params)

        assert variants.save() != null

        params.id = variants.id

        def model = controller.edit()

        assert model.variantsInstance == variants
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/variants/list'

        response.reset()


        populateValidParams(params)
        def variants = new Variants(params)

        assert variants.save() != null

        // test invalid parameters in update
        params.id = variants.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/variants/edit"
        assert model.variantsInstance != null

        variants.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/variants/show/$variants.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        variants.clearErrors()

        populateValidParams(params)
        params.id = variants.id
        params.version = -1
        controller.update()

        assert view == "/variants/edit"
        assert model.variantsInstance != null
        assert model.variantsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/variants/list'

        response.reset()

        populateValidParams(params)
        def variants = new Variants(params)

        assert variants.save() != null
        assert Variants.count() == 1

        params.id = variants.id

        controller.delete()

        assert Variants.count() == 0
        assert Variants.get(variants.id) == null
        assert response.redirectedUrl == '/variants/list'
    }
}
