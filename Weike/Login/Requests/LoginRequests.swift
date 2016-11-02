//
//  LoginRequests.swift
//  Weike
//
//  Created by Cam on 9/1/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class LoginRequests {
    static func login(phone: String, password: String, completion: @escaping (_ user: User?, _ error: Error?) -> Void) {
        var user: User?
        let task = try? APIRequest.postTask("/login/general", params: ["phone": phone as AnyObject, "password": password as AnyObject], completion: { (json, error) in
            guard let userJson = json else {
                completion(nil, error)
                return
            }
            user = try? User.fromJson(userJson)
            completion(user, error)
        })
        task?.resume()
    }
    
    static let timeout = 30.0
    
    static func loginTask(phone: String, password: String, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
        let task = try? APIRequest.postTask("/login/phone/mobile", params: ["phone": phone as AnyObject, "password": password as AnyObject],
                                            completion: { (json, error) in
                                                completion(error)
        })
        return task
    }
    
    static func verifyTask(code: String, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
        let task = try? APIRequest.postTask("/login/verify", params: ["code": code as AnyObject],
                                            completion: { (json, error) in
                                                completion(error)
        })
        return task
    }
}
