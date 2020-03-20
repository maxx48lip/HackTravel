//
//  AppDelegate.swift
//  HackTravel
//
//  Created by Max Pavlov on 14/01/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	let window = UIWindow()

	// MARK: - UIApplicationDelegate

	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		Debugger.log(type: .info, logString: "Стартанул проект")
		self.window.makeKeyAndVisible()
		self.window.rootViewController = ViewController()
		return true
	}
}
