//
//  PokemonListCoordinator.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import UIKit

class PokemonListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let pokemonListViewController = PokemonListViewController()
        navigationController.setViewControllers([pokemonListViewController], animated: false)
    }
}
