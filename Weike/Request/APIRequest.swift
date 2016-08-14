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
    static func getTask(endpoint: String, params: [String: AnyObject], completion: (json: AnyObject?, error: Error?) -> Void) throws -> URLSessionDataTask {
        return try self.task(endpoint: endpoint, method: .GET, params: params, completion: completion)
    }

    static func postTask(endpoint: String, params: [String: AnyObject], completion: (json: AnyObject?, error: Error?) -> Void) throws -> URLSessionDataTask {
        return try self.task(endpoint: endpoint, method: .POST, params: params, completion: completion)
    }

    private static func task(endpoint: String, method: HTTPMethod, params: [String: AnyObject], completion: (json: AnyObject?, error: Error?) -> Void) throws -> URLSessionDataTask {
        var request = URLRequest(url: URL(string: "api/\(endpoint)")!)
        
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
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let jsonData = data else {
                completion(json: nil, error: nil)
                return
            }
            completion(json: try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers), error: nil)
        }
        return task
    }
}
