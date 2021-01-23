//
//  AppCoordinator.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        let pokemonListCoordinator = PokemonListCoordinator(navigationController: navigationController)

        childCoordinators.append(pokemonListCoordinator)
        pokemonListCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
