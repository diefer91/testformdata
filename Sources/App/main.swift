import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.post("formdata") { request in
    guard let text = request.formData?["description"]?.string else { throw Abort.badRequest }
    guard let type = request.formData?["type"]?.string else { throw Abort.badRequest }
    guard let other = request.formData?["name"]?.string else { throw Abort.badRequest }
    guard let imageBytes = request.formData?["image"]?.part.body else { throw Abort.badRequest }
    return "successssss"
}

drop.run()
