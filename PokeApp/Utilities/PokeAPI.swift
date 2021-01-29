//
//  APIHelper.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 26/01/2021.
//

import Foundation

enum PokeAPI {
    
    case pokemon
    
    private var baseURL: URL {
        URL(string: "https://pokeapi.co/api/v2/")!
    }
    
    private var description: String {
        switch self {
        case .pokemon:
            return "pokemon"
        }
    }
    
    var endpoint: URL {
        switch self {
        case .pokemon:
            return self.baseURL.appendingPathComponent(description)
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .pokemon:
            return [URLQueryItem(name: "limit", value: "50")]
        }
    }
    
}
