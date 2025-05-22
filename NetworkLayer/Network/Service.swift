//
//  Service.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 22.05.2025.
//

protocol ServiceProtocol: AnyObject {
    var networkClient: NetworkProtocol { get }
}

class BaseService: ServiceProtocol {
    let networkClient: NetworkProtocol

    init(networkClient: NetworkProtocol) {
        self.networkClient = networkClient
    }
}
