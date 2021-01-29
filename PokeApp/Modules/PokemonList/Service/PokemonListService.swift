//
//  NetworkManager.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import Foundation

protocol PokemonListServiceProtocol {
    func fetchPokemonList(_ completion: @escaping (Result<PokemonAPIResponse, NetworkError>) -> Void)
    func fetchNextPage(_ completion: @escaping (Result<PokemonAPIResponse, NetworkError>) -> Void)
    func fetchPokemon(_ pokemonURL: URL, completion: @escaping (Result<Pokemon, NetworkError>) -> Void)
}

class PokemonListService: PokemonListServiceProtocol {
    private var nextPageURL: URL?
    
    func fetchPokemonList(_ completion: @escaping (Result<PokemonAPIResponse, NetworkError>) -> Void) {
        fetch(api: .pokemon, completion: completion)
    }
    
    func fetchNextPage(_ completion: @escaping (Result<PokemonAPIResponse, NetworkError>) -> Void) {
        if let nextPageURL = nextPageURL {
            fetch(url: nextPageURL, completion: completion)
        }
    }
    
    private func fetch(api: PokeAPI, completion: @escaping (Result<PokemonAPIResponse, NetworkError>) -> Void) {
        var urlComponents = URLComponents(url: api.endpoint, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = api.queryItems
        fetch(url: urlComponents.url!, completion: completion)
    }
    
    
    private func fetch(url: URL, completion: @escaping (Result<PokemonAPIResponse, NetworkError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            if let _ = error {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(PokemonAPIResponse.self, from: data)
                self.nextPageURL = result.nextPage
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
            }
        }

        dataTask.resume()
    }
    
    func fetchPokemon(_ pokemonURL: URL, completion: @escaping (Result<Pokemon, NetworkError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: pokemonURL) { data, response, error in
            
            if let _ = error {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Pokemon.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch(let error) {
                print(error)
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
            }
        }
        
        dataTask.resume()
    }
    
}
    

//    func getPokemonList(_ actualResponse: DefaultResponse<Pokemon>? = nil,
//                     completion: @escaping (Result<DefaultResponse<Pokemon>, NetworkError>) -> Void) {
//
//        var endPoint: String
//        if let safeActualResponse = actualResponse {
//            guard let nextPage = safeActualResponse.nextPage else { return }
//            endPoint = nextPage
//        } else {
//            endPoint = baseURL + "pokemon/"
//        }
//
//        guard let url = URL(string: endPoint) else {
//            completion(.failure(.invalidResponse))
//            return
//        }
//
//        let dataTask = URLSession.shared.dataTask(with: url) {data, response, error in
//
//            if let _ = error {
//                completion(.failure(.invalidResponse))
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let response = try decoder.decode(DefaultResponse<Pokemon>.self, from: data)
//                completion(.success(response))
//            } catch {
//                completion(.failure(.invalidResponse))
//            }
//        }
//
//        dataTask.resume()
//    }
    
//    func getPokemon(from url: String, completion: @escaping (Result<Pokemon, NetworkError>) -> Void) {
//        guard let url = URL(string: url) else {
//            completion(.failure(.invalidResponse))
//            return
//        }
//        
//        let dataTask = URLSession.shared.dataTask(with: url) {data, response, error in
//
//            if let _ = error {
//                completion(.failure(.invalidResponse))
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let pokemon = try decoder.decode(Pokemon.self, from: data)
//                completion(.success(pokemon))
//            } catch {
//                completion(.failure(.invalidResponse))
//            }
//        }
//        
//        dataTask.resume()
//    }
//
//}
