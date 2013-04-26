package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(FooterController)
@Mock(Footer)
class FooterControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/footer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.footerInstanceList.size() == 0
        assert model.footerInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.footerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.footerInstance != null
        assert view == '/footer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/footer/show/1'
        assert controller.flash.message != null
        assert Footer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/footer/list'


        populateValidParams(params)
        def footer = new Footer(params)

        assert footer.save() != null

        params.id = footer.id

        def model = controller.show()

        assert model.footerInstance == footer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/footer/list'


        populateValidParams(params)
        def footer = new Footer(params)

        assert footer.save() != null

        params.id = footer.id

        def model = controller.edit()

        assert model.footerInstance == footer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/footer/list'

        response.reset()


        populateValidParams(params)
        def footer = new Footer(params)

        assert footer.save() != null

        // test invalid parameters in update
        params.id = footer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/footer/edit"
        assert model.footerInstance != null

        footer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/footer/show/$footer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        footer.clearErrors()

        populateValidParams(params)
        params.id = footer.id
        params.version = -1
        controller.update()

        assert view == "/footer/edit"
        assert model.footerInstance != null
        assert model.footerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/footer/list'

        response.reset()

        populateValidParams(params)
        def footer = new Footer(params)

        assert footer.save() != null
        assert Footer.count() == 1

        params.id = footer.id

        controller.delete()

        assert Footer.count() == 0
        assert Footer.get(footer.id) == null
        assert response.redirectedUrl == '/footer/list'
    }
}
