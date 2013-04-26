package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Gen_fontsController)
@Mock(Gen_fonts)
class Gen_fontsControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/gen_fonts/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.gen_fontsInstanceList.size() == 0
        assert model.gen_fontsInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.gen_fontsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.gen_fontsInstance != null
        assert view == '/gen_fonts/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/gen_fonts/show/1'
        assert controller.flash.message != null
        assert Gen_fonts.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_fonts/list'


        populateValidParams(params)
        def gen_fonts = new Gen_fonts(params)

        assert gen_fonts.save() != null

        params.id = gen_fonts.id

        def model = controller.show()

        assert model.gen_fontsInstance == gen_fonts
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_fonts/list'


        populateValidParams(params)
        def gen_fonts = new Gen_fonts(params)

        assert gen_fonts.save() != null

        params.id = gen_fonts.id

        def model = controller.edit()

        assert model.gen_fontsInstance == gen_fonts
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/gen_fonts/list'

        response.reset()


        populateValidParams(params)
        def gen_fonts = new Gen_fonts(params)

        assert gen_fonts.save() != null

        // test invalid parameters in update
        params.id = gen_fonts.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/gen_fonts/edit"
        assert model.gen_fontsInstance != null

        gen_fonts.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/gen_fonts/show/$gen_fonts.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        gen_fonts.clearErrors()

        populateValidParams(params)
        params.id = gen_fonts.id
        params.version = -1
        controller.update()

        assert view == "/gen_fonts/edit"
        assert model.gen_fontsInstance != null
        assert model.gen_fontsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/gen_fonts/list'

        response.reset()

        populateValidParams(params)
        def gen_fonts = new Gen_fonts(params)

        assert gen_fonts.save() != null
        assert Gen_fonts.count() == 1

        params.id = gen_fonts.id

        controller.delete()

        assert Gen_fonts.count() == 0
        assert Gen_fonts.get(gen_fonts.id) == null
        assert response.redirectedUrl == '/gen_fonts/list'
    }
}
