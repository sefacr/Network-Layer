//
//  CharacterResponse.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

import Foundation

struct CharacterResponse: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}
