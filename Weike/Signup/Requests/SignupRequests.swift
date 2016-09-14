//
//  SignupRequests.swift
//  Weike
//
//  Created by Weiyu Zhou on 9/3/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

struct SignupError: Error {
    var localizedDescription: String
    init(description: String) {
        localizedDescription = description
    }
}

class SignupRequests: APIRequest {
    static func signup(phone: String, password: String, completion: @escaping (_ error: Error?) -> Void) {
        let task = try? postTask(endpoint: "/signup/phone/mobile", params: ["phone": phone as AnyObject, "password": password as AnyObject], completion: { (json, error) in
            if let message = json?["message"] {
                completion(SignupError(description: message as! String))
            } else {
                completion(error)
            }
        })
        task?.resume()
    }
}
