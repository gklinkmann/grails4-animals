package de.koo.animals

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class AnimalController {

    AnimalService animalService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond animalService.list(params), model:[animalCount: animalService.count()]
    }

    def show(Long id) {
        respond animalService.get(id)
    }

    def create() {
        respond new Animal(params)
    }

    def save(Animal animal) {
        if (animal == null) {
            notFound()
            return
        }

        try {
            animalService.save(animal)
        } catch (ValidationException e) {
            respond animal.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'animal.label', default: 'Animal'), animal.id])
                redirect animal
            }
            '*' { respond animal, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond animalService.get(id)
    }

    def update(Animal animal) {
        if (animal == null) {
            notFound()
            return
        }

        try {
            animalService.save(animal)
        } catch (ValidationException e) {
            respond animal.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'animal.label', default: 'Animal'), animal.id])
                redirect animal
            }
            '*'{ respond animal, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        animalService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'animal.label', default: 'Animal'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
