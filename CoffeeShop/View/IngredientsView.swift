//
//  IngredientsView.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/4/22.
//

import UIKit

class IngredientsView: UIView {
	
	//TODO: add configure labels based on provided item
	
	private let titleLabel = UILabel()
	private let ingredientsLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configure()
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		layer.cornerRadius = 20
		clipsToBounds = true
		
		addSubview(titleLabel)
		addSubview(ingredientsLabel)
		
		backgroundColor = .systemGray4
		
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "Ingredients"
		titleLabel.textAlignment = .center
		
		ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
		ingredientsLabel.numberOfLines = 0
		ingredientsLabel.text = "Coffee, Water"
		
		NSLayoutConstraint.activate([
		
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
			
			ingredientsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			ingredientsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			ingredientsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			ingredientsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
		])
		
	}
}
