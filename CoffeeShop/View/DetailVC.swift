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
		itemDetailView.configure(for: item)
		configureUI()
	}
	
	
	let itemDetailView = ItemDetailView()
	let bottomContainerView = BottomContainerView()
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print(#function)
		itemDetailView.layoutIfNeeded()
	}
	
	
	private func configureUI() {
		
		//TODO: - Calculate from the safe area.
		
		view.addSubview(itemDetailView)
		view.addSubview(bottomContainerView) // should I use controller instead for collection view
		
		NSLayoutConstraint.activate([
			
			itemDetailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
			itemDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			itemDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			itemDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			
			bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			bottomContainerView.topAnchor.constraint(equalTo: itemDetailView.bottomAnchor),
			bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			bottomContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
