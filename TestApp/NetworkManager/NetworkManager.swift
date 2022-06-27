//
//  NetworkManager.swift
//  TestApp
//
//  Created by Ali Jafarov on 24.06.22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURl = "https://run.mocky.io/v3/eef7a662-3a6a-43b2-b1e6-3cd280cc38d6"
    
    func getData (completion: @escaping (Result<[Card], Error>) -> Void) {
        
        let request = AF.request(baseURl)
        request.responseData { response in
            if let data = response.data {
                do {
                    let cardResult = try JSONDecoder().decode([Card].self, from: data)
                    completion(.success(cardResult))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}
