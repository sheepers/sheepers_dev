class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/gadmin"(view:"/index")

		"500"(view:'/error')


	}
}
