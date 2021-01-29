//
//  PokemonDetailsViewController.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 28/01/2021.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    private lazy var imageContainer: UIView = {
        let buildView = UIView()
        buildView.translatesAutoresizingMaskIntoConstraints = false
        buildView.layer.cornerRadius = cornerRadius
        buildView.backgroundColor = .systemBackground
        view.addSubview(buildView)
        return buildView
    }()
    
    private lazy var pokemonImageView: UIImageView = {
        let buildImageView = UIImageView()
        buildImageView.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.addSubview(buildImageView)
        return buildImageView
    }()
    
    private lazy var typePokemonBoxView: PokemonBoxView = {
        let buildPokemonBoxView = PokemonBoxView()
        buildPokemonBoxView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buildPokemonBoxView)
        return buildPokemonBoxView
    }()
    
    private lazy var abilityPokemonBoxView: PokemonBoxView = {
        let buildPokemonBoxView2 = PokemonBoxView()
        buildPokemonBoxView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buildPokemonBoxView2)
        return buildPokemonBoxView2
    }()
    
    private lazy var heightPokemonBoxView: PokemonBoxView = {
        let buildPokemonBoxView = PokemonBoxView()
        buildPokemonBoxView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buildPokemonBoxView)
        return buildPokemonBoxView
    }()
    
    private lazy var weightPokemonBoxView: PokemonBoxView = {
        let buildPokemonBoxView = PokemonBoxView()
        buildPokemonBoxView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buildPokemonBoxView)
        return buildPokemonBoxView
    }()
    
    private lazy var expPokemonBoxView: PokemonBoxView = {
        let buildPokemonBoxView = PokemonBoxView()
        buildPokemonBoxView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buildPokemonBoxView)
        return buildPokemonBoxView
    }()
    
    private lazy var statusPokemonBoxView: PokemonBoxView = {
        let buildPokemonBoxView = PokemonBoxView()
        buildPokemonBoxView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buildPokemonBoxView)
        return buildPokemonBoxView
    }()
    
    var viewModel: PokemonDetailViewModelProtocol?
    let cornerRadius: CGFloat = 10
    let padding: CGFloat = 16
    let innerSpace: CGFloat = 8
    var accentColor: UIColor!
    
    convenience init(viewModel: PokemonDetailViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    private func configureFields() {
        guard let pokemon = viewModel?.pokemonItem?.pokemon else { return }
        title = pokemon.name.capitalized + " #" + String(pokemon.id)
        pokemonImageView.loadImageFromUrl(pokemon.sprite.url) {
            print("pokemon loaded")
        }
        
        let backgroundColors = UIColor.getBackgroundColor(by: pokemon.types.map{$0.name}.first!)
            view.backgroundColor = backgroundColors.0
            accentColor = backgroundColors.1
        
        typePokemonBoxView.set(tile: "Type",
                               description: pokemon.types.map{$0.name}.joined(separator: "\n").capitalized,
                               backgroundColor: self.accentColor)
        
        abilityPokemonBoxView.set(tile: "Abilities",
                                  description: pokemon.abilities.map{$0.name}.joined(separator: "\n").capitalized,
                                  backgroundColor: self.accentColor)
        
        heightPokemonBoxView.set(tile: "Height", description: "\(Double(pokemon.height/10)) m",
                                 backgroundColor: self.accentColor)
        weightPokemonBoxView.set(tile: "Weight", description: "\(Double(pokemon.weight/10)) kg",
                                 backgroundColor: self.accentColor)
        expPokemonBoxView.set(tile: "Base experience", description: String(pokemon.baseExperience),
                              backgroundColor: self.accentColor)
        
        statusPokemonBoxView.set(tile: "Status",
                                 description: pokemon.stats.map{"\($0.name): \($0.baseStat)"}
                                    .joined(separator: "\n").capitalized,
                                 backgroundColor: self.accentColor)
    }
    
    private func configureView() {
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .systemGreen
        configureImageContainer(safeArea)
        configureInfoView(safeArea)
    }
    
    private func configureImageContainer(_ safeArea: UILayoutGuide) {
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            imageContainer.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            imageContainer.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            imageContainer.heightAnchor.constraint(equalToConstant: 128),
            
            pokemonImageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            pokemonImageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 128),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 128)
        ])
    }
    
    private func configureInfoView(_ safeArea: UILayoutGuide) {
        NSLayoutConstraint.activate([
            typePokemonBoxView.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: padding),
            typePokemonBoxView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            typePokemonBoxView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            
            abilityPokemonBoxView.topAnchor.constraint(equalTo: typePokemonBoxView.bottomAnchor, constant: innerSpace),
            abilityPokemonBoxView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            abilityPokemonBoxView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            
            heightPokemonBoxView.topAnchor.constraint(equalTo: abilityPokemonBoxView.bottomAnchor, constant: innerSpace),
            heightPokemonBoxView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            heightPokemonBoxView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            
            weightPokemonBoxView.topAnchor.constraint(equalTo: heightPokemonBoxView.bottomAnchor, constant: innerSpace),
            weightPokemonBoxView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            weightPokemonBoxView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            
            expPokemonBoxView.topAnchor.constraint(equalTo: weightPokemonBoxView.bottomAnchor, constant: innerSpace),
            expPokemonBoxView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            expPokemonBoxView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            
            statusPokemonBoxView.topAnchor.constraint(equalTo: expPokemonBoxView.bottomAnchor, constant: innerSpace),
            statusPokemonBoxView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            statusPokemonBoxView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding)
            
        ])
    }
    
    
}
