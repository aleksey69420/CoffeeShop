//
//  AppDelegate.swift
//  CoffeeShop
//
//  Created by Aleksey on 4/30/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let dataSource = ItemDataSource(items: Item.testSetOfItems())
		let nc = UINavigationController(rootViewController: HomeVC(dataSource: dataSource))
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = nc
		
		return true
	}
}

