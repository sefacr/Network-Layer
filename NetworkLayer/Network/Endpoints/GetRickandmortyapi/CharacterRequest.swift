//
//  CharacterRequest.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

import Alamofire

final class CharactersRequest: RequestModel {
    init() {
        super.init(
            baseURL: Constant.URLs.rmBaseURL,
            path: "/character",
            method: .get,
            headers: nil,
            parameters: nil,
            encoding: URLEncoding.default
        )
    }
}
