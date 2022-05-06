//
//  ItemDetailView.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/3/22.
//

import UIKit

class ItemDetailView: UIView {
	
	#warning("best way to handle Item  - modelView, configure(for:) - current, init?")

	private let roundItem = UIView()
	private let iconImageView = UIImageView()
	private let priceLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configure()
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
	
	func configure(for item: Item) {
		iconImageView.image = UIImage(named: item.icon)
		priceLabel.text = "$\(item.price)"
	}
	
	
	// frame dependant code - don't know how to set prior to configuring layout using constraints
	// is this the best solution?
	override func layoutSubviews() {
		super.layoutSubviews()
		roundItem.layer.cornerRadius = roundItem.frame.size.width / 2
	}
	
	
	private func configure() {
		
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .systemRed
		
		addSubview(roundItem)
		addSubview(iconImageView)
		addSubview(priceLabel)
		
		
		roundItem.translatesAutoresizingMaskIntoConstraints = false
		roundItem.backgroundColor = .systemYellow
		roundItem.layer.cornerRadius = roundItem.frame.size.width / 2
		roundItem.clipsToBounds = true
		
		iconImageView.translatesAutoresizingMaskIntoConstraints = false
		//iconImageView.backgroundColor = .systemBlue
		iconImageView.contentMode = .scaleAspectFit
		
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		priceLabel.backgroundColor = .systemGreen
		priceLabel.textAlignment = .center
		priceLabel.layer.cornerRadius = 15
		priceLabel.clipsToBounds = true
		
		
		NSLayoutConstraint.activate([
			
			roundItem.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
			roundItem.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
			roundItem.centerXAnchor.constraint(equalTo: centerXAnchor),
			roundItem.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			iconImageView.centerYAnchor.constraint(equalTo: roundItem.centerYAnchor),
			iconImageView.centerXAnchor.constraint(equalTo: roundItem.centerXAnchor),
			iconImageView.widthAnchor.constraint(equalTo: roundItem.widthAnchor, multiplier: 0.4),
			iconImageView.heightAnchor.constraint(equalTo: roundItem.heightAnchor, multiplier: 0.4),
			
			priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			priceLabel.centerYAnchor.constraint(equalTo: roundItem.bottomAnchor),
			priceLabel.widthAnchor.constraint(equalToConstant: 90),
			priceLabel.heightAnchor.constraint(equalToConstant: 50),
		])
	}
}
