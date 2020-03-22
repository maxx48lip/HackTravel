//
//  GlobalCoordinator.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

final class GlobalCoordinator {
	static let rootViewController = HandShakeGraphStartViewController()

	static func open(_ viewcontroller: GlobalCoordinator.ControllerType) {
		Debugger.log(type: .info, logString: "Open \(viewcontroller)")
		switch viewcontroller {
		case .handShakeGraphStartViewController:
			rootViewController.navigationController?.pushViewController(HandShakeGraphStartViewController(), animated: true)
		case .handShakeResultViewController:
			rootViewController.navigationController?.pushViewController(HandShakeResultViewController(), animated: true)
		}
	}

		enum ControllerType {
			case handShakeGraphStartViewController
			case handShakeResultViewController
		}
}
