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
	private var items: [Item]
	
	private(set) var groupedItems: [Item.ItemType: [Item]] = [:]
	
	init(items: [Item]) {
		self.items = items
		self.groupedItems = items.reduce([:]) { (groups, item) -> [Item.ItemType: [Item]] in
			var newGroups = groups
			let itemType = item.type
			newGroups[itemType] = (groups[itemType] ?? []) + [item]
			return newGroups
		}
	}
	
	
	//MARK: UITableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return groupedItems.keys.count
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		let sortedSections = groupedItems.keys.sorted { $0.rawValue < $1.rawValue	}
		return groupedItems[sortedSections[section]]?.count ?? 0
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let sortedSections = groupedItems.keys.sorted { $0.rawValue < $1.rawValue }
		
		let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseId, for: indexPath) as! ItemTableViewCell
		
		if let itemGroup = groupedItems[sortedSections[indexPath.section]] {
			let item = itemGroup[indexPath.row]
			cell.set(item: item)
		} else {
			print("no items in the section")
		}
		
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		let sortedSections = groupedItems.keys.sorted { $0.rawValue < $1.rawValue	}
		return sortedSections[section].title()
	}
}
