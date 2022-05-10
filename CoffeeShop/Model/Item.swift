//
//  Item.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/1/22.
//

import Foundation

struct Item {
	
	enum ItemType: Int, CaseIterable {
		case drink
		case food
		case merch
		
		func title() -> String {
			switch self {
			case .drink: return "Drinks"
			case .food: return "Food"
			case .merch: return "Merch"
			}
		}
	}
	
	let type: ItemType
	let name: String
	let description: String
	let icon: String
	let price: Double
}


extension Item {
	
	//TODO: convert to json data -> convert json to [Item]
	
	static func testSetOfItems() -> [Item] {
		let items = [
			Item(type: .drink, name: "Drip Coffee", description: "Our daily house drip coffee", icon: "drinks_coffee", price: 2.00),
			Item(type: .drink, name: "Cold Brew", description: "Daily brewed cold brew", icon: "drinks_coldbrew", price: 3.00),
			Item(type: .food, name: "Croissant", description: "A crispy, buttery croisant", icon: "foods_croissant", price: 4.00),
			Item(type: .food, name: "Donut", description: "Our popular old fashion Donut", icon: "foods_donut", price: 3.50),
			Item(type: .merch, name: "Coffee Beans", description: "In-house roasted beans, whole or ground", icon: "merch_beans", price: 12.50),
			Item(type: .merch, name: "Newspaper", description: "Daily newspaper", icon: "other_newspaper", price: 3.50)
		]
		
		return items
	}
}
