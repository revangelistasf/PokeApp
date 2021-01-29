//
//  Pokemon.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import Foundation

class PokemonItem: Decodable {
    let name: String
    let url: URL
    var pokemon: Pokemon?
}

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let sprite: Sprite
    let baseExperience: Int
    let height: Int
    let weight: Int
    let stats: [Stats]
    let abilities: [Ability]
    let types: [Type]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprite = "sprites"
        case baseExperience = "base_experience"
        case height
        case weight
        case stats
        case abilities
        case types
    }
}

struct Sprite: Decodable {
    let url: URL?

    enum CodingKeys: String, CodingKey {
        case url = "front_default"
    }
}

struct Stats: Decodable {
    let name: String
    let baseStat: Int
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
    
    enum StatKey: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        baseStat = try values.decode(Int.self, forKey: .baseStat)
        
        let statsKeys = try values.nestedContainer(keyedBy: StatKey.self, forKey: .stat)
        name = try statsKeys.decode(String.self, forKey: .name)
    }
}

struct Ability: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case ability
    }
    
    enum AbilityKey: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let ability = try decoder.container(keyedBy: CodingKeys.self)
        let abilityKeys = try ability.nestedContainer(keyedBy: AbilityKey.self, forKey: .ability)
        name = try abilityKeys.decode(String.self, forKey: .name)
    }
}

struct Type: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    enum TypeKey: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let type = try decoder.container(keyedBy: CodingKeys.self)
        let typeKeys = try type.nestedContainer(keyedBy: TypeKey.self, forKey: .type)
        name = try typeKeys.decode(String.self, forKey: .name)
    }
}
