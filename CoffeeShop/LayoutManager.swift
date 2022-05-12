//
//  LayoutManager.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/12/22.
//

import UIKit

struct LayoutManager {
	func createLayout() -> UICollectionViewLayout {
		
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
		
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
		
		let section = NSCollectionLayoutSection(group: group)
		
		let layout = UICollectionViewCompositionalLayout(section: section)
		
		return layout
	}
}
