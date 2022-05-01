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
		
		let nc = UINavigationController(rootViewController: HomeVC())
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = nc
		
		return true
	}
}

