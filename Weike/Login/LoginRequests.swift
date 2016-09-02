//
//  LoginRequests.swift
//  Weike
//
//  Created by Cam on 9/1/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class LoginRequests: APIRequest {
    static func login(phone: String, password: String, completion: (user: User?, error: Error?) -> Void) {
        var user: User?
        let task = try? getTask(endpoint: "/login/general", params: ["phone": phone, "password": password], completion: { (json, error) in
            guard let userJson = json else {
                completion(user: nil, error: error)
                return
            }
            user = User.fromJson(userJson)
            completion(user: user, error: error)
        })
        task?.resume()
    }
}
