//
//  HandShakeGraphStartBuilder.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

final class HandShakeGraphStartBuilder {

	func makeLabelForTextField() -> UILabel {
		let label = UILabel()
		label.clipsToBounds = true
		label.layer.cornerRadius = 20
		label.layer.borderColor = UIColor.black.cgColor
		label.layer.borderWidth = 1
		label.layer.shadowOffset = CGSize(width: 0, height: 2)
		label.layer.shadowOpacity = 5
		label.layer.shadowRadius = 2
		return label
	}

	func makeTextField() -> UITextField {
		let textField = UITextField()
		textField.placeholder = "id1"
		return textField
	}

	func makeStartButton() -> UIButton {
		let button = StartButton()
		button.titleText = "Start"
		button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
		return button
	}

	@objc func startButtonAction() {
		GlobalCoordinator.open(.handShakeResultViewController)
	}
}
