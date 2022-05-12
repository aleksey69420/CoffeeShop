//
//  ItemCollectionCell.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/12/22.
//

import UIKit

class ItemCollectionCell: UICollectionViewCell {
	
	static let reuseId = String(describing: ItemCollectionCell.self)
	
	let nameLabel = UILabel()
	let priceLabel = UILabel()
	let iconImageView = UIImageView()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	
	private func configure() {
		
		iconImageView.translatesAutoresizingMaskIntoConstraints = false
		iconImageView.backgroundColor = .systemRed
		iconImageView.contentMode = .scaleAspectFit
		iconImageView.layer.cornerRadius = 8
		iconImageView.layer.masksToBounds = true
		iconImageView.setContentHuggingPriority(.defaultLow, for: .vertical)
		
		//nameLabel.translatesAutoresizingMaskIntoConstraints = false  // need this?
		nameLabel.backgroundColor = .systemRed
		nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		nameLabel.textColor = .label
		nameLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
		
		//priceLabel.translatesAutoresizingMaskIntoConstraints = false // need this?
		priceLabel.backgroundColor = .systemRed
		priceLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
		priceLabel.textColor = .secondaryLabel
		priceLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
		
		
		
		let stackView = UIStackView(arrangedSubviews: [iconImageView, nameLabel, priceLabel])
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .fillProportionally
		stackView.spacing = 0
		stackView.backgroundColor = .systemBlue
		
		contentView.addSubview(stackView)
		
		
		NSLayoutConstraint.activate([
			
			iconImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
			iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
			
			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
