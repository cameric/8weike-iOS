//
//  UserRequests.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/10/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class UserRequests {
    static func user(_ id: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void) {
        var user: User?
        let task = try? APIRequest.getTask("/user", params: ["id": id as AnyObject], completion: { (json, error) in
            guard let userJson = json else {
                completion(nil, error)
                return
            }
            user = try? User.fromJson(userJson)
            completion(user, error)
        })
        task?.resume()
    }
}
