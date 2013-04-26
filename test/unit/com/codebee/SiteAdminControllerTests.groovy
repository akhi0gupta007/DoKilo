package com.codebee



import org.junit.*
import grails.test.mixin.*

@TestFor(SiteAdminController)
@Mock(SiteAdmin)
class SiteAdminControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/siteAdmin/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.siteAdminInstanceList.size() == 0
        assert model.siteAdminInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.siteAdminInstance != null
    }

    void testSave() {
        controller.save()

        assert model.siteAdminInstance != null
        assert view == '/siteAdmin/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/siteAdmin/show/1'
        assert controller.flash.message != null
        assert SiteAdmin.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/siteAdmin/list'


        populateValidParams(params)
        def siteAdmin = new SiteAdmin(params)

        assert siteAdmin.save() != null

        params.id = siteAdmin.id

        def model = controller.show()

        assert model.siteAdminInstance == siteAdmin
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/siteAdmin/list'


        populateValidParams(params)
        def siteAdmin = new SiteAdmin(params)

        assert siteAdmin.save() != null

        params.id = siteAdmin.id

        def model = controller.edit()

        assert model.siteAdminInstance == siteAdmin
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/siteAdmin/list'

        response.reset()


        populateValidParams(params)
        def siteAdmin = new SiteAdmin(params)

        assert siteAdmin.save() != null

        // test invalid parameters in update
        params.id = siteAdmin.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/siteAdmin/edit"
        assert model.siteAdminInstance != null

        siteAdmin.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/siteAdmin/show/$siteAdmin.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        siteAdmin.clearErrors()

        populateValidParams(params)
        params.id = siteAdmin.id
        params.version = -1
        controller.update()

        assert view == "/siteAdmin/edit"
        assert model.siteAdminInstance != null
        assert model.siteAdminInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/siteAdmin/list'

        response.reset()

        populateValidParams(params)
        def siteAdmin = new SiteAdmin(params)

        assert siteAdmin.save() != null
        assert SiteAdmin.count() == 1

        params.id = siteAdmin.id

        controller.delete()

        assert SiteAdmin.count() == 0
        assert SiteAdmin.get(siteAdmin.id) == null
        assert response.redirectedUrl == '/siteAdmin/list'
    }
}
