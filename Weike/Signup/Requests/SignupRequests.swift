//
//  SignupRequests.swift
//  Weike
//
//  Created by Weiyu Zhou on 9/3/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class SignupRequests {
    static let timeout = 30.0

    static func signupTask(phone: String, password: String, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
        let task = try? APIRequest.postTask("/signup/phone/mobile", params: ["phone": phone as AnyObject, "password": password as AnyObject],
                                 completion: { (json, error) in
            completion(error)
        })
        return task
    }

    static func verifyTask(code: String, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
        let task = try? APIRequest.postTask("/signup/verify", params: ["code": code as AnyObject],
                                 completion: { (json, error) in
            completion(error)
        })
        return task
    }

    static func nicknameTask(name: String, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
        let task = try? APIRequest.postTask("/profile", params: ["nickname": name as AnyObject],
                                 completion: { (json, error) in
            completion(error)
        })
        return task
    }
}
