//
//  ItemDataSource.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/9/22.
//

import Foundation
import UIKit

class ItemDataSource: NSObject, UITableViewDataSource {
	
	#warning("review the access control after the final implemetation")
	private let items: [Item]
	var drinks: [Item] = []
	var food: [Item] = []
	var merch: [Item] = []
	
	
	init(items: [Item]) {
		self.items = items
		drinks = items.filter { $0.type == .drink }
		food = items.filter { $0.type == .food }
		merch = items.filter { $0.type == .merch }
	}
	
	
	//MARK: UITableViewDataSource
	
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
