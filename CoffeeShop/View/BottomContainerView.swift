//
//  BottomContainerView.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/4/22.
//

import UIKit

class BottomContainerView: UIView {
	
	let ingredientsView = IngredientsView()
	let pairingsView = UIView()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configure()
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
	
	private func configure() {
		backgroundColor = .systemGray
		translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(ingredientsView)
		addSubview(pairingsView)
		
		pairingsView.translatesAutoresizingMaskIntoConstraints = false
		pairingsView.backgroundColor = .systemGray4
		
		NSLayoutConstraint.activate([
			
			ingredientsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
			ingredientsView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			ingredientsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
			ingredientsView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
			
			pairingsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			pairingsView.topAnchor.constraint(equalTo: ingredientsView.bottomAnchor, constant: 20),
			pairingsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			pairingsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
			
		])
	}
}
