//
//  CircleLoadingView.swift
//  HackTravel
//
//  Created by Max Pavlov on 19/01/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit

class CircularProgressView: UIView {

	// First create two layer properties
	private var circleLayer = CAShapeLayer()
	private var progressLayer = CAShapeLayer()

	override init(frame: CGRect) {
		super.init(frame: frame)
		createCircularPath()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		createCircularPath()
	}

	func createCircularPath() {
		let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
										radius: 80,
										startAngle: -.pi / 2,
										endAngle: 3 * .pi / 2,
										clockwise: true)

		circleLayer.path = circularPath.cgPath
		circleLayer.fillColor = UIColor.clear.cgColor
		circleLayer.lineCap = .round
		circleLayer.lineWidth = 12.0
		circleLayer.strokeColor = UIColor.black.cgColor
		layer.addSublayer(circleLayer)

		progressLayer.path = circularPath.cgPath
		progressLayer.fillColor = UIColor.clear.cgColor
		progressLayer.lineCap = .round
		progressLayer.lineWidth = 10.0
		progressLayer.strokeEnd = 0
		progressLayer.strokeColor = UIColor.red.cgColor
		layer.addSublayer(progressLayer)
	}

	func progressAnimation(duration: TimeInterval) {
		let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
		circularProgressAnimation.duration = duration
		circularProgressAnimation.toValue = 1.0
		circularProgressAnimation.fillMode = .forwards
		circularProgressAnimation.isCumulative = false
		circularProgressAnimation.isRemovedOnCompletion = false
		progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
	}
}
