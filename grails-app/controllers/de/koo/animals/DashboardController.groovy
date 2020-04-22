package de.koo.animals

import grails.plugin.springsecurity.annotation.Secured
import groovy.transform.CompileStatic

@CompileStatic
class DashboardController {
	UserService userService
	AnimalService animalService
	
	@Secured(["ROLE_USER"])
    def index() { 
		respond([animalInstanceTotal: animalService.count(),"userInstanceTotal":userService.count()])
	}
}
