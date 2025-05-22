//
//  CreateService.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

import Foundation

final class CreateService: BaseService {

    func createPost(
        title: String,
        body: String,
        userId: Int,
        completion: @escaping (Result<CreateResponse, NetworkError>) -> Void
    ) {
        let request = CreateRequest(title: title, body: body, userId: userId)

        networkClient.request(
            requestModel: request,
            responseType: CreateResponse.self,
            completion: completion
        )
    }
}
