//
//  DefaultRequest.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import Foundation

struct PokemonAPIResponse: Decodable {
    let resultsCount: Int
    let nextPage: URL?
    let results: [PokemonItem]
    
    enum CodingKeys: String, CodingKey {
        case resultsCount = "count"
        case nextPage = "next"
        case results
    }
}
