//
//  SignupRequests.swift
//  Weike
//
//  Created by Weiyu Zhou on 9/3/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class SignupRequests: APIRequest {
    static func signup(phone: String, password: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void) {
        var user: User?
        let task = try? postTask(endpoint: "/signup/phone/mobile", params: ["phone": phone as AnyObject, "password": password as AnyObject], completion: { (json, error) in
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
