//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

struct NetworkError: Error {
    let message: String
    let code: Int?

    init(message: String, code: Int? = nil) {
        self.message = message
        self.code = code
    }

    static let unknown = NetworkError(message: "An unknown error occurred.")
    static let decoding = NetworkError(message: "Failed to decode the response.")
    static let invalidURL = NetworkError(message: "The URL provided was invalid.")
}
