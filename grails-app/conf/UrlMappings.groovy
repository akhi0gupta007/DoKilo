class UrlMappings {

	static mappings = {
		
		"/persistence"(controller: "protectedDemo", action: "protectedDemo")
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
