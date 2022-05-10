//
//  ItemDataSource.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/9/22.
//

import Foundation
import UIKit

class ItemDataSource: NSObject, UITableViewDataSource {
	
	typealias GroupedItems = [ItemType: [Item]]
	
	private var items: [Item]
	private(set) var groupedItems: GroupedItems
	private(set) var sortedSections: [ItemType]
	
	
	init(items: [Item]) {
		self.items = items
		self.groupedItems = items.reduce([:]) { (groups, item) -> GroupedItems in
			var newGroups = groups
			let itemType = item.type
			newGroups[itemType] = (groups[itemType] ?? []) + [item]
			return newGroups
		}
		self.sortedSections = groupedItems.keys.sorted { $0.rawValue < $1.rawValue }
	}
	
	
	//MARK: UITableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return groupedItems.keys.count
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return groupedItems[sortedSections[section]]?.count ?? 0
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		
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
		
		return sortedSections[section].title()
	}
}
