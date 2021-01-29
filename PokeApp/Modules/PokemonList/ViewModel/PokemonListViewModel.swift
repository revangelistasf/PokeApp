//
//  PokemonListViewModel.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 26/01/2021.
//

import Foundation

protocol PokemonListViewModelDelegate: class {
    func pokemonListDidFinishFetch()
    func pokemonDidFinishFetch(named: String)
}

protocol PokemonListViewModelProtocol {
    var pokemonListCount: Int { get }
    var delegate: PokemonListViewModelDelegate? { get set }
    
    func pokemon(from indexPath: IndexPath) -> PokemonItem?
    func indexPathToReload(from pokemonName: String) -> [IndexPath]
    func fetchFirstPokemonList()
    func fetchNextPokemonPage()
}

class PokemonListViewModel: PokemonListViewModelProtocol {
    
    var pokemonListCount: Int { pokemonListItem.count }
    weak var delegate: PokemonListViewModelDelegate?
    private var pokemonListItem: [PokemonItem] = []
    
    let service: PokemonListServiceProtocol
    
    init(service: PokemonListServiceProtocol = PokemonListService()) {
        self.service = service
    }
    
    func pokemon(from indexPath: IndexPath) -> PokemonItem? {
        let row = indexPath.row
        if pokemonListItem.count > row {
            return pokemonListItem[row]
        }
        
        return nil
    }
    
    func indexPathToReload(from pokemonName: String) -> [IndexPath] {
        let row = pokemonListItem.firstIndex{$0.name == pokemonName}
        return [IndexPath(row: row!, section: 0)]
    }
    
    func fetchFirstPokemonList() {
        service.fetchPokemonList { [weak self] result in
            self?.handleFetch(result: result)
        }
    }
    
    func fetchNextPokemonPage() {
        service.fetchNextPage { [weak self] result in
            self?.handleFetch(result: result)
        }
    }
    
    func fetchPokemon(pokemonItem: PokemonItem) {
        service.fetchPokemon(pokemonItem.url) { result in
            switch result {
            case .success(let pokemon):
                pokemonItem.pokemon = pokemon
                self.delegate?.pokemonDidFinishFetch(named: pokemonItem.name)
            case .failure(let networkError):
                print(networkError)
                break
            }
        }
    }
    
    private func handleFetch(result: Result<PokemonAPIResponse, NetworkError>) {
        switch result {
        case .success(let response):
            let newPokemonsItemList = response.results
            DispatchQueue.main.async {
                newPokemonsItemList.forEach { [weak self] pokemonItem in
                    self?.fetchPokemon(pokemonItem: pokemonItem)
                }
            }
            self.pokemonListItem.append(contentsOf: newPokemonsItemList)
        case .failure(let networkError):
            print(networkError)
            break
        }
        
        self.delegate?.pokemonListDidFinishFetch()
    }
    
}
