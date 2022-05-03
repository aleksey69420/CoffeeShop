//
//  DetailVC.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/2/22.
//

import UIKit

class DetailVC: UIViewController {
	
	var item: Item! = Item(name: "Cold Brew", description: "Daily brewed cold brew", icon: "drinks_coldbrew", price: 3.00)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		configureUI()
		
	}
	
	let itemView = UIView()
	let iconImageView = UIImageView()
	let priceLabel = UILabel()
	
	
	private func configureUI() {
		
		//TODO: - Calculate from the safe area.
		// use height or stack view for all the component
		let itemViewSize = view.frame.size.width * 0.75
		
		itemView.translatesAutoresizingMaskIntoConstraints = false
		itemView.backgroundColor = .systemYellow
		itemView.layer.cornerRadius = itemViewSize / 2
		itemView.clipsToBounds = true
		
		
		
		iconImageView.translatesAutoresizingMaskIntoConstraints = false
		iconImageView.image = UIImage(named: item.icon)
		iconImageView.contentMode = .scaleAspectFit
		
		
		itemView.addSubview(iconImageView)
		itemView.addSubview(priceLabel)
		view.addSubview(itemView)
		
		
		priceLabel.translatesAutoresizingMaskIntoConstraints = false
		priceLabel.text = "$\(item.price)"
		priceLabel.backgroundColor = .systemGreen
		priceLabel.textAlignment = .center
		priceLabel.layer.cornerRadius = 15
		priceLabel.clipsToBounds = true
		view.addSubview(priceLabel)
		
		
		NSLayoutConstraint.activate([
			itemView.widthAnchor.constraint(equalToConstant: itemViewSize),
			itemView.heightAnchor.constraint(equalToConstant: itemViewSize),
			itemView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			itemView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
			
			iconImageView.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
			iconImageView.centerXAnchor.constraint(equalTo: itemView.centerXAnchor),
			iconImageView.widthAnchor.constraint(equalTo: itemView.widthAnchor, multiplier: 0.4),
			iconImageView.heightAnchor.constraint(equalTo: itemView.heightAnchor, multiplier: 0.4),
			
			priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			priceLabel.centerYAnchor.constraint(equalTo: itemView.bottomAnchor),
			priceLabel.widthAnchor.constraint(equalToConstant: 90),
			priceLabel.heightAnchor.constraint(equalToConstant: 50)
			
		])
	}
}
