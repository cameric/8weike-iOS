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
    static func getTask(endpoint: String, params: [String: AnyObject], completion: @escaping (_ json: [String: Any]?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
        return try self.task(endpoint: endpoint, method: "GET", params: params, completion: completion)
    }

    static func postTask(endpoint: String, params: [String: AnyObject], completion: @escaping (_ json: [String: Any]?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
        return try self.task(endpoint: endpoint, method: "POST", params: params, completion: completion)
    }

    /**
     * Get a request task
     * It throws an error if the front end has error, and it returns backend error in completion
     */
    private static func task(endpoint: String, method: String, params: [String: AnyObject], completion: @escaping (_ json: [String: Any]?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
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
            completion(responseObject as! [String: Any]?, error) // to-do: create new Error type
            return
        }
        return task
    }
}
