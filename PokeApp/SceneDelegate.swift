//
//  SceneDelegate.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        let pokemonListViewController = PokemonListViewController(viewModel: PokemonListViewModel())
        let navigationController = UINavigationController(rootViewController: pokemonListViewController)
//        let navigationController = UINavigationController(rootViewController: PokemonDetailsViewController())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        self.window?.windowScene = scene        
    }

}
