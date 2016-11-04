//
//  ForgetPasswordRequests.swift
//  Weike
//
//  Created by Danny Yulang Wang on 11/4/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class ForgetPasswordRequests: APIRequest {
    static let timeout = 30.0
//    
//    static func changePasswordTask(phone: String, password: String, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
//        let task = try? APIRequest.postTask("/signup/phone/mobile", params: ["phone": phone as AnyObject, "password": password as AnyObject],
//                                            completion: { (json, error) in
//                                                completion(error)
//        })
//        return task
//    }
    
    static func verifyTask(code: String, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
        let task = try? APIRequest.postTask("/signup/verify", params: ["code": code as AnyObject],
                                            completion: { (json, error) in
                                                completion(error)
        })
        return task
    }
}
