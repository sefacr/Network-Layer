//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    func request<T: Decodable>(
        requestModel: RequestModel,
        responseType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void)
}

final class NetworkManager {
        
    private let session: Session
    
    init(session: Session = .default) {
        self.session = session
    }
    
}

// MARK: - NetworkProtocol

extension NetworkManager: NetworkProtocol {
    
    func request<T: Decodable>(
        requestModel: RequestModel,
        responseType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        let urlString = requestModel.baseURL + requestModel.path

        logRequest(url: urlString, requestModel: requestModel)

        session.request(
            urlString,
            method: requestModel.method,
            parameters: requestModel.parameters,
            encoding: requestModel.encoding,
            headers: requestModel.headers
        )
        .validate()
        .responseData { response in
            self.logResponse(response)
            self.parseResponse(response, completion: completion)
        }
    }
}
    
// MARK: - Private Methods

private extension NetworkManager {
    
    private func parseResponse<T: Decodable>(
        _ response: AFDataResponse<Data>,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        switch response.result {
        case .success(let data):
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                print("❌ Decode error: \(error)")
                let raw = String(data: data, encoding: .utf8) ?? "nil"
                print("📦 Raw:\n\(raw)")
                completion(.failure(.decoding))
            }
        case .failure:
            let code = response.response?.statusCode
            let message = HTTPURLResponse.localizedString(forStatusCode: code ?? 500)
            completion(.failure(.init(message: message, code: code)))
        }
    }
    
    private func logRequest(url: String, requestModel: RequestModel) {
        print("""
        🔹 [REQUEST]
        ▶️ URL: \(url)
        ▶️ Method: \(requestModel.method.rawValue)
        ▶️ Headers: \(requestModel.headers?.dictionary ?? [:])
        ▶️ Parameters: \(requestModel.parameters ?? [:])
        """)
    }
    
    private func logResponse(_ response: AFDataResponse<Data>) {
        let status = response.response?.statusCode ?? -1
        let url = response.request?.url?.absoluteString ?? "N/A"
        let dataString = String(data: response.data ?? Data(), encoding: .utf8) ?? "empty"
        
        print("""
        🔸 [RESPONSE]
        ✅ Status: \(status)
        ✅ URL: \(url)
        ✅ Body: \(dataString)
        """)
    }
}
