//
//  ViewController.swift
//  CoffeeShop
//
//  Created by Aleksey on 4/30/22.
//

import UIKit

class HomeVC: UIViewController {
	
	
	let items = [
		[
			Item(name: "Drip Coffee", description: "Our daily house drip coffee", icon: "drinks_coffee", price: 2.00),
			Item(name: "Cold Brew", description: "Daily brewed cold brew", icon: "drinks_coldbrew", price: 3.00)
		],
		[
			Item(name: "Croissant", description: "A crispy, buttery croisant", icon: "food_croissant", price: 4.00),
			Item(name: "Donut", description: "Our popular old fashion Donut", icon: "foods_donut", price: 3.50)
		],
		[
			Item(name: "Coffee Beans", description: "In-house roasted beans, whole or ground", icon: "merch_beans", price: 12.50),
			Item(name: "Newspaper", description: "Daily newspaper", icon: "other_newspaper", price: 3.50)
		]
	]
	
	
	
	
	private var tableView = UITableView()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		title = "Coffee Shop"
		
		
		configureTableView()
		configureHeaderView()
	}
	
	
	private func configureTableView() {
		
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		
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
}


//MARK: Table View - Delegate
extension HomeVC: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}


//MARK: Table View - Data Source
extension HomeVC: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items[section].count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = items[indexPath.section][indexPath.row].name
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

