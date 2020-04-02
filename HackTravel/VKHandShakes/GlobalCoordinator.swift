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
			DispatchQueue.main.async {
				rootViewController.navigationController?.pushViewController(HandShakeGraphStartViewController(), animated: true)
			}
			rootViewController.navigationController?.pushViewController(HandShakeGraphStartViewController(), animated: true)
		case .handShakeResultViewController(chains: let chains):
				DispatchQueue.main.async {
					rootViewController.navigationController?
						.pushViewController(HandShakeResultViewController(chains: chains), animated: true)
				}
		}
	}

	enum ControllerType {
		case handShakeGraphStartViewController
		case handShakeResultViewController(chains: [ChainsModel])
	}
}
