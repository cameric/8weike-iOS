//
//  LoginRequests.swift
//  Weike
//
//  Created by Cam on 9/1/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class LoginRequests: APIRequest {
    static func login(phone: String, password: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void) {
        var user: User?
        let task = try? postTask("/login/general", params: ["phone": phone as AnyObject, "password": password as AnyObject], completion: { (json, error) in
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
