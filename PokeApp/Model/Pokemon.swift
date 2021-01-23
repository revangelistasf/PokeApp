//
//  Pokemon.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import Foundation

struct Pokemon: Decodable {
    var id: Int?
    var name: String?
    var url: String?
    var sprite: Sprite?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case sprite = "sprites"
    }
}

struct Sprite: Decodable {
    let url: String?

    enum CodingKeys: String, CodingKey {
        case url = "front_default"
    }
}
