package de.koo.animals

import java.util.Date;

class Weighing {
	Date weighted
	Date lastUpdated
	Date dateCreated
	String lastUpdatedBy
	String createdBy
	Integer weight
	String comment
	Animal animal
	
	def 
	static belongsTo = Animal
	
	static constraints = {
        weighted(nullable:false)
        weight(nullable:false,min: 1)
        comment(nullable:true)
	}
	String toString() {
		def weighted=new java.text.SimpleDateFormat("dd.MM.yyyy").format(this.weighted)
		"${weighted}: ${this.weight}"
	}
}
