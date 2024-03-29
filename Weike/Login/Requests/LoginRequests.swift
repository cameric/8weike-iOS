//
//  LoginRequests.swift
//  Weike
//
//  Created by Cam on 9/1/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class LoginRequests {
    static func loginTask(phone: String, password: String, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
        let task = try? APIRequest.postTask("/login/phone", params: ["phone": phone as AnyObject, "password": password as AnyObject],
                                            completion: { (json, error) in
            completion(error)
        })
        return task
    }
}
