package de.koo.animals

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class WeighingController {

    WeighingService weighingService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond weighingService.list(params), model:[weighingCount: weighingService.count()]
    }

    def show(Long id) {
        respond weighingService.get(id)
    }

    def create() {
        respond new Weighing(params)
    }

    def save(Weighing weighing) {
        if (weighing == null) {
            notFound()
            return
        }

        try {
            weighingService.save(weighing)
        } catch (ValidationException e) {
            respond weighing.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'weighing.label', default: 'Weighing'), weighing.id])
                redirect weighing
            }
            '*' { respond weighing, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond weighingService.get(id)
    }

    def update(Weighing weighing) {
        if (weighing == null) {
            notFound()
            return
        }

        try {
            weighingService.save(weighing)
        } catch (ValidationException e) {
            respond weighing.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'weighing.label', default: 'Weighing'), weighing.id])
                redirect weighing
            }
            '*'{ respond weighing, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        weighingService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'weighing.label', default: 'Weighing'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'weighing.label', default: 'Weighing'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
