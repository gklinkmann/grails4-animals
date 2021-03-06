package de.koo.animals

import org.springframework.security.core.authority.SimpleGrantedAuthority

import grails.plugin.springsecurity.SpringSecurityService
import grails.testing.gorm.DomainUnitTest
import grails.testing.web.controllers.ControllerUnitTest
import grails.validation.ValidationException
import spock.lang.*

class AnimalControllerSpec extends Specification implements ControllerUnitTest<AnimalController>, DomainUnitTest<Animal> {

    def populateValidParams(params) {
        assert params != null

		params.name='A1'
		params.cageNr=1
		params.arrived=new Date()
		params.approbation='E1'
		params.gender='m'
    }

    void "Test the index action returns the correct model"() {
        given:
        controller.animalService = Mock(AnimalService) {
            1 * list(_) >> []
            1 * count() >> 0
        }

        when:"The index action is executed"
        controller.index()

        then:"The model is correct"
        !model.animalList
        model.animalCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
        controller.create()

        then:"The model is correctly created"
        model.animal!= null
    }

    void "Test the save action with a null instance"() {
        when:"Save is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        controller.save(null)

        then:"A 404 error is returned"
        response.redirectedUrl == '/animal/index'
        flash.message != null
    }

    void "Test the save action correctly persists"() {
        given:
	        controller.animalService = Mock(AnimalService) {
	            1 * save(_ as Animal)
	        }
			controller.springSecurityService = Stub(SpringSecurityService) {
				isLoggedIn() >> true
				getPrincipal() >> new org.springframework.security.core.userdetails.User("admin","admin",[new SimpleGrantedAuthority("ROLE_ADMIN")])
			}

        when:"The save action is executed with a valid instance"
	        response.reset()
	        request.contentType = FORM_CONTENT_TYPE
	        request.method = 'POST'
	        populateValidParams(params)
	        def animal = new Animal(params)
	        animal.id = 1
	
	        controller.save(animal)

        then:"A redirect is issued to the show action"
	        response.redirectedUrl == '/animal/show/1'
	        controller.flash.message != null
    }

    void "Test the save action with an invalid instance"() {
        given:
	        controller.animalService = Mock(AnimalService) {
	            1 * save(_ as Animal) >> { Animal animal ->
	                throw new ValidationException("Invalid instance", animal.errors)
	            }
	        }
			controller.springSecurityService = Stub(SpringSecurityService) {
				isLoggedIn() >> true
				getPrincipal() >> new org.springframework.security.core.userdetails.User("admin","admin",[new SimpleGrantedAuthority("ROLE_ADMIN")])
			}

        when:"The save action is executed with an invalid instance"
	        request.contentType = FORM_CONTENT_TYPE
	        request.method = 'POST'
	        def animal = new Animal()
	        controller.save(animal)

        then:"The create view is rendered again with the correct model"
	        model.animal != null
	        view == 'create'
    }

    void "Test the show action with a null id"() {
        given:
        controller.animalService = Mock(AnimalService) {
            1 * get(null) >> null
        }

        when:"The show action is executed with a null domain"
        controller.show(null)

        then:"A 404 error is returned"
        response.status == 404
    }

    void "Test the show action with a valid id"() {
        given:
        controller.animalService = Mock(AnimalService) {
            1 * get(2) >> new Animal()
        }

        when:"A domain instance is passed to the show action"
        controller.show(2)

        then:"A model is populated containing the domain instance"
        model.animal instanceof Animal
    }

    void "Test the edit action with a null id"() {
        given:
        controller.animalService = Mock(AnimalService) {
            1 * get(null) >> null
        }

        when:"The show action is executed with a null domain"
        controller.edit(null)

        then:"A 404 error is returned"
        response.status == 404
    }

    void "Test the edit action with a valid id"() {
        given:
        controller.animalService = Mock(AnimalService) {
            1 * get(2) >> new Animal()
        }

        when:"A domain instance is passed to the show action"
        controller.edit(2)

        then:"A model is populated containing the domain instance"
        model.animal instanceof Animal
    }


    void "Test the update action with a null instance"() {
        when:"Save is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then:"A 404 error is returned"
        response.redirectedUrl == '/animal/index'
        flash.message != null
    }

    void "Test the update action correctly persists"() {
        given:
	        controller.animalService = Mock(AnimalService) {
	            1 * save(_ as Animal)
	        }
			controller.springSecurityService = Stub(SpringSecurityService) {
				isLoggedIn() >> true
				getPrincipal() >> new org.springframework.security.core.userdetails.User("admin","admin",[new SimpleGrantedAuthority("ROLE_ADMIN")])
			}

        when:"The save action is executed with a valid instance"
	        response.reset()
	        request.contentType = FORM_CONTENT_TYPE
	        request.method = 'PUT'
	        populateValidParams(params)
	        def animal = new Animal(params)
	        animal.id = 1
	
	        controller.update(animal)

        then:"A redirect is issued to the show action"
	        response.redirectedUrl == '/animal/show/1'
	        controller.flash.message != null
    }

    void "Test the update action with an invalid instance"() {
        given:
	        controller.animalService = Mock(AnimalService) {
	            1 * save(_ as Animal) >> { Animal animal ->
	                throw new ValidationException("Invalid instance", animal.errors)
	            }
	        }
			controller.springSecurityService = Stub(SpringSecurityService) {
				isLoggedIn() >> true
				getPrincipal() >> new org.springframework.security.core.userdetails.User("admin","admin",[new SimpleGrantedAuthority("ROLE_ADMIN")])
			}

        when:"The save action is executed with an invalid instance"
	        request.contentType = FORM_CONTENT_TYPE
	        request.method = 'PUT'
	        controller.update(new Animal())

        then:"The edit view is rendered again with the correct model"
	        model.animal != null
	        view == 'edit'
    }

    void "Test the delete action with a null instance"() {
        when:"The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then:"A 404 is returned"
        response.redirectedUrl == '/animal/index'
        flash.message != null
    }

    void "Test the delete action with an instance"() {
        given:
        controller.animalService = Mock(AnimalService) {
            1 * delete(2)
        }

        when:"The domain instance is passed to the delete action"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(2)

        then:"The user is redirected to index"
        response.redirectedUrl == '/animal/index'
        flash.message != null
    }
}






