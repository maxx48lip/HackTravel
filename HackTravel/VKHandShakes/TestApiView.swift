//
//  TestApiView.swift
//  VKHandShakes
//
//  Created by Max Pavlov on 01/04/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

final class TestApiView: UIView {
	func checkApi() {
		layer.cornerRadius = 4
		layer.borderColor = UIColor.black.cgColor
		layer.borderWidth = 0.5
		backgroundColor = .red
		BaseChain.makeRequest(type: .testApi, completion: { [weak self] data in
			Debugger.log(type: .magic, logString: "\(String(data: data ?? Data(), encoding: .utf8) ?? "nil")")
			if data != nil {
				DispatchQueue.main.async {
					self?.backgroundColor = .green
				}
			} else {
				DispatchQueue.main.async {
					self?.backgroundColor = .red
				}
			}
		})
	}
}
