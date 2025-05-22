//
//  CreateRequest.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

import Alamofire

final class CreateRequest: RequestModel {
    init(title: String, body: String, userId: Int) {
        let params: Parameters = [
            "title": title,
            "body": body,
            "userId": userId
        ]

        super.init(
            baseURL: Constant.URLs.jphBaseURL,
            path: "/posts",
            method: .post,
            headers: ["Content-Type": "application/json"],
            parameters: params,
            encoding: JSONEncoding.default
        )
    }
}
