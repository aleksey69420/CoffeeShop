//
//  CollectionVC.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/12/22.
//

import UIKit

class PairingsVC: UIViewController {
	
	let pairings: [Item] = [
		Item(type: .drink, name: "Drip Coffee", description: "Our daily house drip coffee", icon: "drinks_coffee", price: 2.00),
		Item(type: .drink, name: "Cold Brew", description: "Daily brewed cold brew", icon: "drinks_coldbrew", price: 3.00),
		Item(type: .food, name: "Croissant", description: "A crispy, buttery croisant", icon: "foods_croissant", price: 4.00)
	]
	
	private var titleLabel = UILabel()
	private var collectionView: UICollectionView!
	private var itemCellRegistration: UICollectionView.CellRegistration<ItemCollectionViewCell, Item>!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureCollectionView()
		layoutUI()
	}
	
	private func configureCollectionView() {
		
		let layout = LayoutManager().createLayout()

		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		collectionView.dataSource = self
		
		collectionView.backgroundColor = .clear
		collectionView.alwaysBounceVertical = false
		
		itemCellRegistration = UICollectionView.CellRegistration(handler: { cell, indexPath, model in
			cell.nameLabel.text = model.name
			cell.priceLabel.text = "$\(model.price)"
			cell.iconImageView.image = UIImage(named: model.icon)
		})
	}
	
	
	private func layoutUI() {
		view.addSubview(titleLabel)
		view.addSubview(collectionView)
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "pairings"
		titleLabel.textColor = .label
		titleLabel.textAlignment = .center
		titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
		
		NSLayoutConstraint.activate([
			
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
	}
}


extension PairingsVC: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return pairings.count
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		return collectionView.dequeueConfiguredReusableCell(using: itemCellRegistration, for: indexPath, item: pairings[indexPath.row])
	}
}
