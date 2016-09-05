//
//  UserRequests.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/10/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class UserRequests: APIRequest {
    static func user(id: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void) {
        var user: User?
        let task = try? getTask(endpoint: "/user", params: ["id": id as AnyObject], completion: { (json, error) in
            guard let userJson = json else {
                completion(nil, error)
                return
            }
            user = User.fromJson(userJson)
            completion(user, error)
        })
        task?.resume()
    }
}
