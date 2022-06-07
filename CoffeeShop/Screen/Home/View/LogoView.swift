//
//  LogoView.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/10/22.
//

import UIKit

class LogoView: UIView {

	let logoImageView = UIImageView()
	let nameLabel = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		addSubview(logoImageView)
		addSubview(nameLabel)
		
		logoImageView.translatesAutoresizingMaskIntoConstraints = false
		logoImageView.image = UIImage(named: "logo_coffee")
		logoImageView.contentMode = .scaleAspectFit
		
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		nameLabel.text = "COFFEE SHOP"
		nameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
		nameLabel.textAlignment = .center
		
		NSLayoutConstraint.activate([
			
			logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			logoImageView.widthAnchor.constraint(equalTo: heightAnchor, constant: -32),
			
			nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 16),
			nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
		])
	}
}
