//
//  DetailVC.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/2/22.
//

import UIKit

class DetailVC: UIViewController {
	
	private var item: Item!
	private let itemDetailView = ItemDetailView()
	private let itemBottomView = ItemBottomView()
	
	
	init(item: Item) {
		super.init(nibName: nil, bundle: nil)
		self.item = item
		title = item.name
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureVC()
		itemDetailView.configure(for: item)
		configureUI()
	}
	
	
	private func configureVC() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationController?.navigationBar.prefersLargeTitles = true
		view.backgroundColor = .systemBackground
	}
	
	
	private func configureUI() {
		
		//TODO: - Calculate from the safe area.
		
		view.addSubview(itemDetailView)
		view.addSubview(itemBottomView) // should I use controller instead for collection view
		
		NSLayoutConstraint.activate([
			
			itemDetailView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
			itemDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			itemDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			itemDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			
			itemBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			itemBottomView.topAnchor.constraint(equalTo: itemDetailView.bottomAnchor),
			itemBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			itemBottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
