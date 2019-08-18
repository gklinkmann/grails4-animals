package de.koo.animals

class AnimalTagLib {
	static defaultEncodeAs = [taglib:'none']
	//static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

	def displayBoolean = {attrs, body->
		def value=attrs["boolean"]
		if(value!=null&&value){
			def html="""<img src="${resource(dir:'assets/skin',file:'accept.png')}" alt="${value}" title="${value}" />"""
			out << body() << html.toString()
		} else {
			out << body() << "&nbsp;"
		}
	}

	def displayWeightDifference = {attrs, body->
		def weighings = new ArrayList(attrs["weighings"])
		def weightDifference=0
		def cssClass="green"

		// min 2 weights
		if (weighings?.size()>1) {
			def lastWeighing=weighings.get(weighings.size()-1)
			def penultimateWeighing=weighings.get(weighings.size()-2)

			weightDifference=lastWeighing.weight-penultimateWeighing.weight
		}

		if (weightDifference<0) {
			cssClass="red"
		}

		out<<"""<span class="${cssClass}">${weightDifference}</span>"""
	}

	def displayImages = {attrs, body->
		def images = attrs["images"]
		def animalName = attrs["animalName"]
		
		if(images){
			images.each {image ->
				def extension = image?.name.split("\\.")[-1]
				def imageUrl = "${grailsApplication.config.de.koo.animals.images.url}/${animalName}"
				
				switch(extension.toUpperCase()){
					case ["JPG", "PNG", "GIF"]:
						def html = """
							<a data-fancybox="gallery" href="${imageUrl}/${image.name}">
							<img src="${imageUrl}/t${image.name}"
									alt="${animalName} ${image.name}"
									title="${animalName} ${image.name}" />
							</a>
						"""

						out << html
						break
					default:
						out << "<p>wrong extension</p>"
						break
				}
			}
		} else {
			out << "<!-- no file -->"
		}
	}

}
