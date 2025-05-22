//
//  CharacterService.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

import Foundation

final class CharacterService: BaseService {

    func getCharacters(completion: @escaping (Result<CharacterResponse, NetworkError>) -> Void) {
        let request = CharactersRequest()

        networkClient.request(
            requestModel: request,
            responseType: CharacterResponse.self,
            completion: completion
        )
    }
}
