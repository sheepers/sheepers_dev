class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/gadmin"(view:"/index")
         "/"(view: "/login/auth")
		"500"(view:'/error')


	}
}
