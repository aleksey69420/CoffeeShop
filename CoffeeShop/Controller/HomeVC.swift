//
//  ViewController.swift
//  CoffeeShop
//
//  Created by Aleksey on 4/30/22.
//

import UIKit

class HomeVC: UIViewController {
	
		
	#warning("temp solution - refactor all items logic to the data source class")
	//TODO: - add logo view
	
	let items = [
	 Item(type: .drink, name: "Drip Coffee", description: "Our daily house drip coffee", icon: "drinks_coffee", price: 2.00),
	 Item(type: .drink, name: "Cold Brew", description: "Daily brewed cold brew", icon: "drinks_coldbrew", price: 3.00),
	 Item(type: .food, name: "Croissant", description: "A crispy, buttery croisant", icon: "foods_croissant", price: 4.00),
	 Item(type: .food, name: "Donut", description: "Our popular old fashion Donut", icon: "foods_donut", price: 3.50),
	 Item(type: .merch, name: "Coffee Beans", description: "In-house roasted beans, whole or ground", icon: "merch_beans", price: 12.50),
	 Item(type: .merch, name: "Newspaper", description: "Daily newspaper", icon: "other_newspaper", price: 3.50)
 ]
	
	private var drinks: [Item] = []
	private var food: [Item] = []
	private var merch: [Item] = []
	
	
	private var tableView = UITableView()

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureVC()
		configureTableView()
		configureHeaderView()
		
		drinks = items.filter { $0.type == .drink }
		food = items.filter { $0.type == .food }
		merch = items.filter { $0.type == .merch }
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
	
	private func configureTableView() {
		
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.reuseId)
		tableView.rowHeight = ItemTableViewCell.rowHeigh
		
		tableView.delegate = self
		tableView.dataSource = self
		
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	
	private func configureHeaderView() {
		let header = TableViewHeader()
		header.frame.size.height = 44
		tableView.tableHeaderView = header
	}
	
	
	private func configureVC() {
		view.backgroundColor = .systemBackground
	}
}


//MARK: Table View - Delegate
extension HomeVC: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		var item: Item
		
		switch indexPath.section {
		case 0: item = drinks[indexPath.row]
		case 1: item = food[indexPath.row]
		case 2: item = merch[indexPath.row]
		default: return
		}
		
		let detailVC = DetailVC()
		detailVC.item = item
		self.navigationController?.pushViewController(detailVC, animated: true)

	}
}


//MARK: Table View - Data Source
extension HomeVC: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return Item.ItemType.allCases.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0: return drinks.count
		case 1: return food.count
		case 2: return merch.count
		default: return 0
		}
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var item: Item
		
		let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseId, for: indexPath) as! ItemTableViewCell
		
		switch indexPath.section {
		case 0: item = drinks[indexPath.row]
		case 1: item = food[indexPath.row]
		case 2: item = merch[indexPath.row]
		default: return UITableViewCell()
		}
		
		cell.set(item: item)
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0: return "Drinks"
		case 1: return "Food"
		case 2: return "Merch"
		default: return ""
		}
	}
}

