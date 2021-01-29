//
//  PokemonCell.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 23/01/2021.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    static let reusableID = "PokemonCell"
    var pokemonImageView = UIImageView(frame: .zero)
    var pokemonNameLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func set(pokemon: PokemonItem) {
//        pokemonNameLabel.text = pokemon.name.capitalized
//        if let imageURL = pokemon.pokemon?.sprite?.url {
//            pokemonImageView.downloadImage(from: imageURL)
//        }
//    }
    
    private func configure() {
        configureCell()
        configurePokemonImageView()
        configurePokemonNameLabel()
    }
    
    private func configureCell() {
        layer.cornerRadius = 15
        backgroundColor = .systemBackground
        pokemonNameLabel.textAlignment = .center
        pokemonNameLabel.font = .preferredFont(forTextStyle: .body)
        pokemonNameLabel.adjustsFontSizeToFitWidth = true
        pokemonNameLabel.minimumScaleFactor = 0.80
    }
        
    private func configurePokemonImageView() {
        let padding: CGFloat = 8
        
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pokemonImageView)
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            pokemonImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            pokemonImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            pokemonImageView.heightAnchor.constraint(equalTo: pokemonImageView.widthAnchor)
        ])
    }
    
    private func configurePokemonNameLabel() {
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pokemonNameLabel)
        NSLayoutConstraint.activate([
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 12),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            pokemonNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
