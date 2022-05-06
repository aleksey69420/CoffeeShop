//
//  Item.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/1/22.
//

import Foundation

struct Item {
	
	enum ItemType: String, CaseIterable {
		case drink
		case food
		case merch
	}
	
	let type: ItemType
	let name: String
	let description: String
	let icon: String
	let price: Double
}
