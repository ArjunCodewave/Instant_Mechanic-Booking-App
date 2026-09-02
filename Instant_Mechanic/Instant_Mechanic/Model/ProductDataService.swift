//
//  ProductDataService.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 02/09/26.
//

import Foundation
class ProductDataService {
    
    private let baseURL = "http://127.0.0.1:8000/products/all_products"
    func fetchProducts(completion: @escaping (Result<[Task], Error>) -> Void) {

        guard let url = URL(string: baseURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(
                    NetworkError.serverError(httpResponse.statusCode)
                ))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let products = try JSONDecoder()
                    .decode(TaskResponce.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(products.data))
                }

            } catch {
                print("Decoding error:", error)
                completion(.failure(error))
            }

        }.resume()
    }
 
       
    
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case serverError(Int)
    case noData
    case decodingError
}
struct TaskResponce: Codable {
    let status: String
    let data: [Task]
}
