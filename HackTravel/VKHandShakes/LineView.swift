//
//  LineView.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit

final class LineView: UIView {

	let line = CAShapeLayer()

	override init(frame: CGRect) {
		super.init(frame: frame)
		line.path = createLine().cgPath
		line.fillColor = UIColor.clear.cgColor
		line.lineCap = .round
		line.lineWidth = 4.0
		line.strokeColor = UIColor.gray.cgColor
		layer.addSublayer(line)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func createLine() -> UIBezierPath {
		let path = UIBezierPath()

		path.move(to: CGPoint())
		path.addLine(to: CGPoint(x: 0, y: bounds.height))

		path.close()

		return path
	}
}
