//
//  Post.swift
//  Weike
//
//  Created by Weiyu Zhou on 10/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

enum UserParseError: Error {
    case wrongTitle
    case wrongAuthor
    case wrongTime
    case wrongImage
}

class Post: NSObject {
    var title: String
    var author: User
    var time: Date
    var image: UIImage
    var likes = [User]()
    var comments = [Comment]()

    init(title: String, from author: User, at time: Date, image: UIImage) {
        self.title = title
        self.author = author
        self.time = time
        self.image = image
        super.init()
    }

    static func fromJson(_ json: [String: Any]) throws -> Post {
        guard let title = json["title"] as? String else { throw UserParseError.wrongTitle }

        guard let authorJson = json["author"] as? [String : Any] else { throw UserParseError.wrongAuthor }
        guard let author = try? User.fromJson(authorJson) else { throw UserParseError.wrongAuthor }

        guard let time = (json["time"] as? String)?.dateFromISO8601 else { throw UserParseError.wrongTime }

        let image = UIImage() // todo: Parse Image
        return Post(title: title, from: author, at: time, image: image)
    }
}
