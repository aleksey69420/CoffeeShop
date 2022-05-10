//
//  ViewController.swift
//  CoffeeShop
//
//  Created by Aleksey on 4/30/22.
//

import UIKit

class HomeVC: UIViewController {
	
	//TODO: - add logo view
	
	
	private var tableView = UITableView()
	private var dataSource: ItemDataSource
	
	
	init(dataSource: ItemDataSource) {
		self.dataSource = dataSource
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureVC()
		configureTableView()
		configureHeaderView()
		
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
		tableView.dataSource = dataSource
		
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
		
		#warning("refactor the delegate methods out of vc")
		switch indexPath.section {
		case 0: item = dataSource.drinks[indexPath.row]
		case 1: item = dataSource.food[indexPath.row]
		case 2: item = dataSource.merch[indexPath.row]
		default: return
		}
		
		let detailVC = DetailVC(item: item)
		self.navigationController?.pushViewController(detailVC, animated: true)
	}
}

