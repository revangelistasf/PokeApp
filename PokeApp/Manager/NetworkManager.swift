//
//  NetworkManager.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
    private let baseURL = "https://pokeapi.co/api/v2/"
    
    private init() {}

    func getPokemons(_ actualResponse: DefaultResponse<Pokemon>? = nil,
                     completion: @escaping (Result<DefaultResponse<Pokemon>, NetworkError>) -> Void) {

        var endPoint: String
        if let safeActualResponse = actualResponse {
            guard let nextPage = safeActualResponse.nextPage else { return }
            endPoint = nextPage
        } else {
            endPoint = baseURL + "pokemon/"
        }

        guard let url = URL(string: endPoint) else {
            completion(.failure(.invalidResponse))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) {data, response, error in

            if let _ = error {
                completion(.failure(.invalidResponse))
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(DefaultResponse<Pokemon>.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.invalidResponse))
            }
        }

        dataTask.resume()
    }

}
