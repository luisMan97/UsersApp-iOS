//
//  Router.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import Alamofire

enum ApiManagerConstants {
    enum keys {
        static let endpoint = "https://jsonplaceholder.typicode.com/"
    }
}

enum Router: URLRequestConvertible {
    
    case Users
    case Posts([String: AnyObject])
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .Users, 
             .Posts:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .Users:
            return "users"
        case .Posts:
            return "posts"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        guard let url = URL(string: ApiManagerConstants.keys.endpoint) else {
            return URLRequest(url: URL(fileURLWithPath: ""))
        }
        
        var mutableURLRequest = URLRequest(url: url.appendingPathComponent(path))
        mutableURLRequest.httpMethod = method.rawValue
        
        print("URL Service: ", mutableURLRequest)
        
        switch self {
        case .Users:
            return try Alamofire.JSONEncoding.default.encode(mutableURLRequest as URLRequestConvertible, with: nil)
        case .Posts:
            return try Alamofire.JSONEncoding.default.encode(mutableURLRequest as URLRequestConvertible, with: nil)
        }
    }
    
}


