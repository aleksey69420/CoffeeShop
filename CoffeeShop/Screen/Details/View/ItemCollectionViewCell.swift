//
//  ItemCell.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/12/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
	
	static let reuseId = String(describing: ItemCollectionViewCell.self)
	
	let nameLabel = UILabel()
	let priceLabel = UILabel()
	let iconImageView = UIImageView()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	
	private func configure() {
		// cell customization
		layer.cornerRadius = 15
		layer.masksToBounds = true
		
		iconImageView.translatesAutoresizingMaskIntoConstraints = false
		iconImageView.backgroundColor = .systemGray
		iconImageView.contentMode = .scaleAspectFit
		
		nameLabel.translatesAutoresizingMaskIntoConstraints = false  // need this?
		nameLabel.backgroundColor = .systemGray2
		nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		nameLabel.textColor = .label
		
		priceLabel.translatesAutoresizingMaskIntoConstraints = false // need this?
		priceLabel.backgroundColor = .systemGray3
		priceLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
		priceLabel.textColor = .secondaryLabel
		
		
		let infoStack = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
		infoStack.axis = .vertical
		infoStack.alignment = .center
		infoStack.distribution = .fillEqually
		infoStack.spacing = 0
		infoStack.backgroundColor = .systemGreen

		
		let stackView = UIStackView(arrangedSubviews: [iconImageView, infoStack])
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.backgroundColor = .systemBlue
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.spacing = 20
		stackView.distribution = .fillEqually
		
		
		addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
		])
	}
}
