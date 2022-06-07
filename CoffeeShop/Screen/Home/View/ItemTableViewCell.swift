//
//  ItemTableViewCell.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/2/22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
	
	static let reuseId = String(describing: ItemTableViewCell.self)
	static let rowHeigh: CGFloat = 80
	
	private var iconImageView = UIImageView()
	private var nameLabel = UILabel()
	private var descriptionLabel = UILabel()
	private var priceLabel = UILabel()
	
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configure()
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
	
	func set(item: Item) {
		iconImageView.image = UIImage(named: item.icon)
		nameLabel.text = item.name
		descriptionLabel.text = item.description
		priceLabel.text = "$\(item.price)"
	}
	
	

	private func configure() {
		
		
		iconImageView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(iconImageView)
		iconImageView.contentMode = .scaleAspectFit
		
		
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
		
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
		descriptionLabel.tintColor = .tertiaryLabel
		
		
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		//stackView.spacing = 4
		stackView.distribution = .fill
		stackView.addArrangedSubview(nameLabel)
		stackView.addArrangedSubview(descriptionLabel)
		addSubview(stackView)
		
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		priceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
		addSubview(priceLabel)
		
		
		let contentHeight = ItemTableViewCell.rowHeigh / 2
		
		NSLayoutConstraint.activate([
			
			iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
			iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			iconImageView.heightAnchor.constraint(equalToConstant: contentHeight),
			iconImageView.widthAnchor.constraint(equalToConstant: contentHeight),
			
			priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			
			stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
			stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
			stackView.heightAnchor.constraint(equalToConstant: contentHeight),
			stackView.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8),
		])
	}
}
