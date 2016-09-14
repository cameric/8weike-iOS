//
//  User.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/10/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class User: NSObject {
    var id: String
    var name: String
    var phone: String

    var avatar: UIImage?

    init(id: String, name: String, phone: String) {
        self.id = id
        self.name = name
        self.phone = phone
        super.init()
    }

    static func fromJson(_ json: [String: Any]) -> User {
        // todo
        return User(id: "", name: "", phone: "")
    }
}
