//
//  APIRequest.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

enum HTTPMethod {
    case POST
    case GET
}

protocol APIRequest {}

extension APIRequest {
    static func getTask(endpoint: String, params: [String: AnyObject], completion: @escaping (_ json: AnyObject?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
        return try self.task(endpoint: endpoint, method: .GET, params: params, completion: completion)
    }

    static func postTask(endpoint: String, params: [String: AnyObject], completion: @escaping (_ json: AnyObject?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
        return try self.task(endpoint: endpoint, method: .POST, params: params, completion: completion)
    }

    /**
     * Get a request task
     * It throws an error if the front end has error, and it returns backend error in completion
     */
    private static func task(endpoint: String, method: HTTPMethod, params: [String: AnyObject], completion: @escaping (_ json: AnyObject?, _ error: Error?) -> Void) throws -> URLSessionDataTask {
        let hostName = "http://8weike.com/api"

        var request = URLRequest(url: URL(string: "\(hostName)\(endpoint)")!)

        switch method {
        case .GET:
            request.httpMethod = "GET"
            break
        case .POST:
            request.httpMethod = "POST"
            break
        }

        request.setValue("", forHTTPHeaderField: "")
        request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            guard let jsonData = data else {
                completion(nil, nil)
                return
            }
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            completion(json as AnyObject?, nil)
        })
        return task
    }
}
