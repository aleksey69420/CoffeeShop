//
//  ViewController.swift
//  CoffeeShop
//
//  Created by Aleksey on 4/30/22.
//

import UIKit

class HomeVC: UIViewController {
	
	let drinks = ["Drip Coffee", "Cold Brew", "Pourover", "Latte", "Iced Latte"]
	
	var tableView = UITableView()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		title = "Coffee Shop"
		
		configureTableView()
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
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return drinks.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = drinks[indexPath.row]
		return cell
	}
}

