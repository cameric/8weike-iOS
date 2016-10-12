//
//  APIRequest.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import AFNetworking

protocol APIRequest {}

extension APIRequest {
    static func getTask(_ endpoint: String, params: [String: AnyObject], completion: @escaping (_ json: [String: Any]?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
        return try self.task(endpoint, method: "GET", params: params, completion: completion)
    }

    static func postTask(_ endpoint: String, params: [String: AnyObject], completion: @escaping (_ json: [String: Any]?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
        return try self.task(endpoint, method: "POST", params: params, completion: completion)
    }

    /**
     * Get a request task
     * It throws an error if the front end has error, and it returns backend error in completion
     */
    fileprivate static func task(_ endpoint: String, method: String, params: [String: AnyObject], completion: @escaping (_ json: [String: Any]?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
        let config = URLSessionConfiguration.default
        let manager = AFURLSessionManager(sessionConfiguration: config)

        let hostName = "http://8weike.com/api"
        let url = "\(hostName)\(endpoint)"

        let request = AFJSONRequestSerializer().request(withMethod: method,
                                                        urlString: url,
                                                        parameters: params,
                                                        error: nil)
        request.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")

        let task = manager.dataTask(with: request as URLRequest) { (response, responseObject, error) in
            let httpResponse = response as? HTTPURLResponse
            let json = responseObject as! [String: Any]?
            if let message = json?["message"] {
                let userInfo: [String: Any] = [NSLocalizedDescriptionKey: message,
                                               NSLocalizedFailureReasonErrorKey : message]
                completion(json, NSError(domain: "APIRequestErrorDomain",
                                         code: httpResponse!.statusCode, userInfo: userInfo))
            } else {
                completion(json, error)
            }
        }
        return task
    }
}
