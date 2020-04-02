//
//  AlertsAssembly.swift
//  VKHandShakes
//
//  Created by Max Pavlov on 01/04/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

final class AlertsAssembly {

	static func showErrorAlert(type: ErrorAlertType, description: String? = nil) {
		Debugger.log(type: .info, logString: "Showing alert: " + type.rawValue)
		let alert = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
		var message = type.rawValue
		if let description = description {
			message += "\n Additional Info: " + description
		}
		let attributedText = NSMutableAttributedString(string: message, attributes: [.font: UIFont.systemFont(ofSize: 16)])
		alert.setValue(attributedText, forKey: "attributedMessage")
		alert.view.tintColor = UIColor.red
		alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
		GlobalCoordinator.rootViewController.present(alert, animated: true)
	}

	// swiftlint:disable identifier_name
	static let mapTypes: [Int: ErrorAlertType] = [-1: .m1,
												 -2: .m2]

	enum ErrorAlertType: String {
		case unknown = "Unknown error"
		case m1 = "Code: -1. Can not resolve request with this parameters"
		case m2 = "Code: -2. Calculation error"
	}
}
