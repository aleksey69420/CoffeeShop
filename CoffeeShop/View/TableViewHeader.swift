//
//  TableViewHeader.swift
//  CoffeeShop
//
//  Created by Aleksey on 5/2/22.
//

import UIKit


class TableViewHeader: UIView {
	
	let sortButton: UIButton! = {
		let button = UIButton(frame: .zero)
		//button.backgroundColor = .systemGreen
		button.setTitleColor(.label, for: .normal)
		button.setTitle("sort", for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	
	let filterButton: UIButton! = {
		let button = UIButton(frame: .zero)
		//button.backgroundColor = .systemGreen
		button.setTitleColor(.label, for: .normal)
		button.setTitle("filter", for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		//backgroundColor = .systemPink
		configure()
	}
	
	required init?(coder: NSCoder) { fatalError() }
	
	//TODO: - Learn about intrinsic size. Is this applicable here?
	
	
	private func configure() {
		addSubview(sortButton)
		addSubview(filterButton)
		
		NSLayoutConstraint.activate([
			sortButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			sortButton.widthAnchor.constraint(equalToConstant: 50),
			sortButton.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			filterButton.trailingAnchor.constraint(equalTo: sortButton.leadingAnchor, constant: -20),
			filterButton.widthAnchor.constraint(equalToConstant: 50),
			filterButton.centerYAnchor.constraint(equalTo: sortButton.centerYAnchor)
		])
	}
}
