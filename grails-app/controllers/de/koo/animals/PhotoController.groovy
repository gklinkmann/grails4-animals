package de.koo.animals

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PhotoController {

    PhotoService photoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond photoService.list(params), model:[photoCount: photoService.count()]
    }

    def show(Long id) {
        respond photoService.get(id)
    }

    def create() {
        respond new Photo(params)
    }

    def save(Photo photo) {
        if (photo == null) {
            notFound()
            return
        }

        try {
            photoService.save(photo)
        } catch (ValidationException e) {
            respond photo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'photo.label', default: 'Photo'), photo.id])
                redirect photo
            }
            '*' { respond photo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond photoService.get(id)
    }

    def update(Photo photo) {
        if (photo == null) {
            notFound()
            return
        }

        try {
            photoService.save(photo)
        } catch (ValidationException e) {
            respond photo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'photo.label', default: 'Photo'), photo.id])
                redirect photo
            }
            '*'{ respond photo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        photoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
