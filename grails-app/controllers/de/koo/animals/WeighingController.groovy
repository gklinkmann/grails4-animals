package de.koo.animals

import static org.springframework.http.HttpStatus.*

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.validation.ValidationException

class WeighingController {
	def springSecurityService
	
    WeighingService weighingService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	@Secured(["ROLE_USER"])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond weighingService.list(params), model:[weighingCount: weighingService.count()]
    }

	@Secured(["ROLE_USER"])
    def create() {
        respond new Weighing(params)
    }

	@Secured(["ROLE_USER"])
	@Transactional
    def save(Weighing weighing) {
		def animal
		
        if (weighing == null) {
            notFound()
            return
        } else {
			weighing.createdBy=springSecurityService.principal.username
			weighing.lastUpdatedBy=springSecurityService.principal.username
			animal=Animal.get( weighing?.animal?.id )
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
                redirect(controller: "animal", action: "show", id: animal?.id)
            }
            '*' { respond weighing, [status: CREATED] }
        }
    }

	@Secured(["ROLE_USER"])
    def edit(Long id) {
        respond weighingService.get(id)
    }

	@Secured(["ROLE_USER"])
	@Transactional
    def update(Weighing weighing) {
		def animal
		
        if (weighing == null) {
            notFound()
            return
        } else {
			weighing.lastUpdatedBy=springSecurityService.principal.username
			animal=Animal.get( weighing?.animal?.id )
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
                redirect(controller: "animal", action: "show", id: animal?.id)
            }
            '*'{ respond weighing, [status: OK] }
        }
    }

	@Secured(["ROLE_USER"])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

		def animal=Animal.get(weighingService.get(id)?.animal?.id)
        weighingService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'weighing.label', default: 'Weighing'), id])
                redirect(controller: "animal", action: "show", id: animal?.id)
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
