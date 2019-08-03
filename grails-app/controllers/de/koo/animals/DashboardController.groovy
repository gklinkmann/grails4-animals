package de.koo.animals

import grails.plugin.springsecurity.annotation.Secured

class DashboardController {

	@Secured(["ROLE_USER"])
    def index() { 
		[animalInstanceTotal: Animal.count(),"userInstanceTotal":User.count()]
	}
}
