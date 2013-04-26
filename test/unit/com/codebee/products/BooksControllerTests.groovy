package com.codebee.products



import org.junit.*
import grails.test.mixin.*

@TestFor(BooksController)
@Mock(Books)
class BooksControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/books/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.booksInstanceList.size() == 0
        assert model.booksInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.booksInstance != null
    }

    void testSave() {
        controller.save()

        assert model.booksInstance != null
        assert view == '/books/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/books/show/1'
        assert controller.flash.message != null
        assert Books.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/books/list'


        populateValidParams(params)
        def books = new Books(params)

        assert books.save() != null

        params.id = books.id

        def model = controller.show()

        assert model.booksInstance == books
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/books/list'


        populateValidParams(params)
        def books = new Books(params)

        assert books.save() != null

        params.id = books.id

        def model = controller.edit()

        assert model.booksInstance == books
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/books/list'

        response.reset()


        populateValidParams(params)
        def books = new Books(params)

        assert books.save() != null

        // test invalid parameters in update
        params.id = books.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/books/edit"
        assert model.booksInstance != null

        books.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/books/show/$books.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        books.clearErrors()

        populateValidParams(params)
        params.id = books.id
        params.version = -1
        controller.update()

        assert view == "/books/edit"
        assert model.booksInstance != null
        assert model.booksInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/books/list'

        response.reset()

        populateValidParams(params)
        def books = new Books(params)

        assert books.save() != null
        assert Books.count() == 1

        params.id = books.id

        controller.delete()

        assert Books.count() == 0
        assert Books.get(books.id) == null
        assert response.redirectedUrl == '/books/list'
    }
}
