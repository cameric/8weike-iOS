//
//  UserRequest.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/10/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class UserRequest: APIRequest {
    static func user(id: String, completion: (user: User?) -> Void) {
        var user: User?
        let task = try? getTask(endpoint: "/user", params: ["id": id], completion: { (json, error) in
            guard let userJson = json else {
                completion(user: nil)
                return
            }
            user = User.fromJson(userJson)
            completion(user: user)
        })
        task?.resume()
    }
}
