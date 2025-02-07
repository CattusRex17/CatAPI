//
//  CatApiService.swift
//  CatsApi
//
//  Created by Mauricio Rodriguez on 6/2/2025.
//

import Foundation


class CatAPIService {
    static let shared = CatAPIService()
    private let apiURL = "https://api.thecatapi.com/v1/images/search?limit=10&page="
    
    func fetchCats(page: Int, completion: @escaping (Result<[Cat], Error>) -> Void) {
        let urlString = "\(apiURL)\(page)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let cats = try JSONDecoder().decode([Cat].self, from: data)
                print(cats)
                completion(.success(cats))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
