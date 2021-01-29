//
//  PokemonBoxView.swift
//  PokeApp
//
//  Created by Roberto Evangelista on 28/01/2021.
//

import UIKit

class PokemonBoxView: UIView {
        
    private lazy var descriptionView: UIView = {
        var builderView = UIView()
        builderView.translatesAutoresizingMaskIntoConstraints = false
        builderView.layer.cornerRadius = 10
        builderView.backgroundColor = .white
        addSubview(builderView)
        return builderView
    }()
    
    private lazy var titleLabel: UILabel = {
        var builderTitleLabel = UILabel()
        builderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        builderTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        builderTitleLabel.textAlignment = .center
        addSubview(builderTitleLabel)
        return builderTitleLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var builderDescriptionLabel = UILabel()
        builderDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        builderDescriptionLabel.font = UIFont.systemFont(ofSize: 14)
        builderDescriptionLabel.textAlignment = .center
        builderDescriptionLabel.numberOfLines = 0
        descriptionView.addSubview(builderDescriptionLabel)
        return builderDescriptionLabel
    }()
            
    init(tile: String, description: String) {
        super.init(frame: .zero)
        titleLabel.text = tile
        descriptionLabel.text = description
        backgroundColor = .secondaryGreen
        configureView()
    }

    init(tile: String, description: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        titleLabel.text = tile
        descriptionLabel.text = description
        self.backgroundColor = backgroundColor
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondaryGreen
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func configureView() {
        self.layer.cornerRadius = 10
        let padding: CGFloat = 2
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            descriptionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            descriptionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            descriptionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -padding)
        ])
    }
    
    func set(tile: String, description: String) {
        titleLabel.text = tile
        descriptionLabel.text = description
    }
    
}
