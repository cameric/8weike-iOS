//
//  SignupRequests.swift
//  Weike
//
//  Created by Weiyu Zhou on 9/3/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class SignupRequests: APIRequest {
    static func signup(phone: String, password: String, completion: @escaping (_ error: Error?) -> Void) {
        let task = try? postTask(endpoint: "/signup/phone/mobile",
                                 params: ["phone": phone as AnyObject, "password": password as AnyObject],
                                 completion: { (json, error) in
            completion(error)
        })
        task?.resume()
    }

    static func verify(code: String, completion: @escaping (_ error: Error?) -> Void) {
        let task = try? postTask(endpoint: "/signup/verify",
                                 params: ["code": code as AnyObject],
                                 completion: { (json, error) in
            completion(error)
        })
        task?.resume()
    }

    static func nickname(_ name: String, completion: @escaping (_ error: Error?) -> Void) {
        let task = try? postTask(endpoint: "/profile",
                                 params: ["nickname": name as AnyObject],
                                 completion: { (json, error) in
            completion(error)
        })
        task?.resume()
    }
}
