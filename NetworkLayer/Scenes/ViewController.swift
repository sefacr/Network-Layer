//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Sefa Acar on 15.04.2025.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue

        getRequestRAM()
//        postRequestJPH()
    }
}

private extension ViewController {

    func getRequestRAM() {
        // MARK: - Get Request

        let service = CharacterService(networkClient: NetworkManager())

        service.getCharacters { result in
            switch result {
            case .success(let response):
                print("✅ Toplam karakter sayısı: \(response.results.count)")
                response.results.forEach { print("👤 \($0.name)") }

            case .failure(let error):
                print("❌ Hata: \(error.message)")
            }
        }
    }

    func postRequestJPH() {
        // MARK: - Post Request

        let service = CreateService(networkClient: NetworkManager())

        service.createPost(title: "sefa", body: "test", userId: 1) { result in
            switch result {
            case .success(let response):
                print("✅ Post ID: \(response.id)")

            case .failure(let error):
                print("❌ Hata: \(error.message)")
            }
        }
    }
}
