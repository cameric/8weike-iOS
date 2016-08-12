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
    static func getTask(endpoint: String, params: [String: AnyObject], completion: (json: AnyObject?) -> Void) -> URLSessionDataTask? {
        return self.task(endpoint: endpoint, method: .GET, params: params, completion: completion)
    }

    static func postTask(endpoint: String, params: [String: AnyObject], completion: (json: AnyObject?) -> Void) -> URLSessionDataTask? {
        return self.task(endpoint: endpoint, method: .POST, params: params, completion: completion)
    }

    private static func task(endpoint: String, method: HTTPMethod, params: [String: AnyObject], completion: (json: AnyObject?) -> Void) -> URLSessionDataTask? {
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
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        } catch {
            // Unable to create JSON object
            return nil
        }
        
        let session = URLSession.shared()
        let task = session.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: NSError?) -> Void in
            guard let jsonData = data else {
                completion(json: nil)
                return
            }
            completion(json: try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers))
        }
        return task
    }
}
