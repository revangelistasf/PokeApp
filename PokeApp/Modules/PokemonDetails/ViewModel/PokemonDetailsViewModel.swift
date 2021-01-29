//
//  PokemonDetailsViewModel.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 28/01/2021.
//

import Foundation

protocol PokemonDetailViewModelProtocol {
    var pokemonItem: PokemonItem? { get set }
}

class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    var pokemonItem: PokemonItem?
    
}
