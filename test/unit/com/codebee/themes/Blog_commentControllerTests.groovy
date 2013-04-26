package com.codebee.themes



import org.junit.*
import grails.test.mixin.*

@TestFor(Blog_commentController)
@Mock(Blog_comment)
class Blog_commentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/blog_comment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.blog_commentInstanceList.size() == 0
        assert model.blog_commentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.blog_commentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.blog_commentInstance != null
        assert view == '/blog_comment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/blog_comment/show/1'
        assert controller.flash.message != null
        assert Blog_comment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/blog_comment/list'


        populateValidParams(params)
        def blog_comment = new Blog_comment(params)

        assert blog_comment.save() != null

        params.id = blog_comment.id

        def model = controller.show()

        assert model.blog_commentInstance == blog_comment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/blog_comment/list'


        populateValidParams(params)
        def blog_comment = new Blog_comment(params)

        assert blog_comment.save() != null

        params.id = blog_comment.id

        def model = controller.edit()

        assert model.blog_commentInstance == blog_comment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/blog_comment/list'

        response.reset()


        populateValidParams(params)
        def blog_comment = new Blog_comment(params)

        assert blog_comment.save() != null

        // test invalid parameters in update
        params.id = blog_comment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/blog_comment/edit"
        assert model.blog_commentInstance != null

        blog_comment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/blog_comment/show/$blog_comment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        blog_comment.clearErrors()

        populateValidParams(params)
        params.id = blog_comment.id
        params.version = -1
        controller.update()

        assert view == "/blog_comment/edit"
        assert model.blog_commentInstance != null
        assert model.blog_commentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/blog_comment/list'

        response.reset()

        populateValidParams(params)
        def blog_comment = new Blog_comment(params)

        assert blog_comment.save() != null
        assert Blog_comment.count() == 1

        params.id = blog_comment.id

        controller.delete()

        assert Blog_comment.count() == 0
        assert Blog_comment.get(blog_comment.id) == null
        assert response.redirectedUrl == '/blog_comment/list'
    }
}
