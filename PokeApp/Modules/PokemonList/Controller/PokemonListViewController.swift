//
//  PokemonListViewController.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var viewModel: PokemonListViewModelProtocol?
    
    convenience init(viewModel: PokemonListViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        configureView()
        configureCollectionView()
        viewModel?.delegate = self
        viewModel?.fetchFirstPokemonList()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Pokedex"
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: self.view.bounds,
                                          collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        self.view.addSubview(collectionView)
        self.configureCollectionViewLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.reusableID)
    }
    
    private func configureCollectionViewLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func reloadRow(pokemonNamed: String) {
        if let indexPathes = self.viewModel?.indexPathToReload(from: pokemonNamed) {
            self.collectionView.reloadItems(at: indexPathes)
        }
    }

}

extension PokemonListViewController: PokemonListViewModelDelegate {
    func pokemonDidFinishFetch(named: String) {
        if let indexPathes = self.viewModel?.indexPathToReload(from: named) {
            collectionView.reloadItems(at: indexPathes)
        }
    }
    
    func pokemonListDidFinishFetch() {
        dismissLoadingView()
        collectionView.reloadData()
    }
}


extension PokemonListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.pokemonListCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.reusableID,
                                                      for: indexPath) as! PokemonCell
        
        if let pokemonItem = viewModel?.pokemon(from: indexPath) {
            cell.pokemonNameLabel.text = pokemonItem.name.capitalized
            cell.pokemonImageView.loadImageFromUrl(pokemonItem.pokemon?.sprite.url, completion: {
                let backgroundColors = UIColor.getBackgroundColor(by: (pokemonItem.pokemon?.types.map{$0.name}.first)!)
                cell.setColor(primary: backgroundColors.0, secondary: backgroundColors.1)
                collectionView.reloadItems(at: [indexPath])
            })
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonDetailViewModel = PokemonDetailViewModel()
        let selectedPokemonItem = viewModel?.pokemon(from: indexPath)
        pokemonDetailViewModel.pokemonItem = selectedPokemonItem
        let destinationController = PokemonDetailsViewController(viewModel: pokemonDetailViewModel)
        navigationController?.pushViewController(destinationController, animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            showLoadingView()
            self.viewModel?.fetchNextPokemonPage()
        }
    }
}
