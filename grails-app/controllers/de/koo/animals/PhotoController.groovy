package de.koo.animals

import grails.plugin.springsecurity.annotation.Secured
import grails.gorm.transactions.Transactional
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import cr.co.arquetipos.imageTools.ImageTool

class PhotoController {
	def springSecurityService
    PhotoService photoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(["ROLE_USER"])
	def upload() {
		def photoInstance = new Photo(params)
		
		def animal = Animal.get( photoInstance?.animal?.id )

		if(animal) {
			//handle uploaded file
			def uploadedFile = request.getFile('image')
			if(!uploadedFile.empty){
				if(log.isDebugEnabled()){
					log.debug "Class: ${uploadedFile.class}"
					log.debug "Name: ${uploadedFile.name}"
					log.debug "OriginalFileName: ${uploadedFile.originalFilename}"
					log.debug "Size: ${uploadedFile.size}"
					log.debug "ContentType: ${uploadedFile.contentType}"
				}

				def imageDir = new File(grailsApplication.config.de.koo.animals.images.path, "/${animal.name}")
				log.debug ("imageDir: ${imageDir}")
				
				if (!imageDir.exists()) {
					imageDir.mkdirs()
				}

				photoInstance.name = uploadedFile.originalFilename

				def imageTool = new ImageTool()
				
				//uploadedFile.transferTo( new File( imageDir, uploadedFile.originalFilename))

				// thumbnails
				imageTool.load(uploadedFile.bytes)
				imageTool.thumbnail(150)
				imageTool.writeResult("${imageDir}/t${photoInstance.name}", "JPEG")

				// lower scaled photos
				imageTool.load(uploadedFile.bytes)
				imageTool.thumbnail(1024)
				imageTool.writeResult("${imageDir}/${photoInstance.name}", "JPEG")

//				uploadedFile?.fileItem?.delete()

				photoInstance.createdBy=springSecurityService.principal.username
				
				if (photoInstance.save()) {
					flash.message = "${message(code: 'default.created.message', args: [message(code: 'photo.label', default: 'Photo')])}"
					redirect(controller: "animal", action: "show", id: animal.id)
				} else {
					render(view: "create", model: [photoInstance: photoInstance])
				}
			} else {
				flash.message = "Upload not successful"
				render(view: "create", model: [photoInstance: photoInstance])
			}
		} else {
			flash.message = "Animal not found with id ${params.id}"
			redirect(controller: "animal")
		}
	}

	@Secured(["ROLE_ADMIN"])
    @Transactional
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
