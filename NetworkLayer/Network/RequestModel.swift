//
//  RequestModel.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

import Alamofire

class RequestModel {
    
    let baseURL: String
    let path: String
    let method: HTTPMethod
    let headers: HTTPHeaders?
    let parameters: Parameters?
    let encoding: ParameterEncoding
    
    init(
        baseURL: String,
        path: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.encoding = encoding
    }
}

