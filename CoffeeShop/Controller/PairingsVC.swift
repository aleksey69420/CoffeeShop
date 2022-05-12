//
//  PairingsVC.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/11/22.
//

import UIKit

class PairingsVC: UIViewController {
	
	let pairings: [Item] = [
		Item(type: .drink, name: "Drip Coffee", description: "Our daily house drip coffee", icon: "drinks_coffee", price: 2.00),
		Item(type: .drink, name: "Cold Brew", description: "Daily brewed cold brew", icon: "drinks_coldbrew", price: 3.00),
		Item(type: .food, name: "Croissant", description: "A crispy, buttery croisant", icon: "foods_croissant", price: 4.00)
	]
	
	
	private var collectionView: UICollectionView!
	private var itemCellRegistration: UICollectionView.CellRegistration<ItemCollectionCell, Item>!

	
    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .systemRed
		configureCollectionView()
    }
	
	
	private func configureCollectionView() {
		
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 120, height: 120)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // do I need this
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(collectionView)
		
		collectionView.dataSource = self
		
		itemCellRegistration = UICollectionView.CellRegistration(handler: { cell, indexPath, model in
			cell.nameLabel.text = model.name
			cell.priceLabel.text = "$\(model.price)"
			cell.iconImageView.image = UIImage(named: model.icon)
		})
		
		
		collectionView.backgroundColor = .lightGray
		
		
		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
