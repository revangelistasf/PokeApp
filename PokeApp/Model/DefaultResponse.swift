//
//  DefaultRequest.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import Foundation

struct DefaultResponse<T: Decodable>: Decodable {
    let resultsCount: Int
    let nextPage: String?
    let previousPage: String?
    let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case resultsCount = "count"
        case nextPage = "next"
        case previousPage = "previous"
        case results
    }
}
