//
//  StartButton.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

final class StartButton: UIButton {

	var borderWidth: CGFloat = 1.0
	var borderColor = UIColor.black.cgColor

	var titleText: String? {
		didSet {
			setTitle(titleText, for: .normal)
			setTitleColor(.black, for: .normal)
			setTitleColor(.darkGray, for: .highlighted)
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		setup()
	}

	func setup() {
		clipsToBounds = true
		layer.cornerRadius = frame.size.height / 2
		layer.borderColor = borderColor
		layer.borderWidth = borderWidth
		layer.shadowOffset = CGSize(width: 0, height: 1)
		layer.shadowOpacity = 15
		layer.shadowRadius = 2
	}
}
