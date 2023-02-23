//
//  SearchService.swift
//  LM
//
//  Created by Aditya Khadke on 23/02/23.
//

import Foundation

class ITunesSearchService {
    func search(completion: @escaping (Result<ITunesSearchResponse, Error>) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=adele") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid data", code: 0, userInfo: nil)))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(ITunesSearchResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
