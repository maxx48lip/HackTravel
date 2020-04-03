//
//  LoadingView.swift
//  VKHandShakes
//
//  Created by Max Pavlov on 03/04/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit

final class LoadingView: UIView {

	private let topLeftDot = UIView()
	private let bottomRightDot = UIView()

	override func didMoveToSuperview() {
		topLeftDot.backgroundColor = .black
		topLeftDot.frame = CGRect(x: bounds.maxX / 4, y: bounds.maxY / 4, width: bounds.width / 4, height: bounds.height / 4)
		topLeftDot.layer.cornerRadius = topLeftDot.frame.width / 2
		bottomRightDot.backgroundColor = .black
		bottomRightDot.frame = CGRect(x: bounds.maxX * 0.75, y: bounds.maxY * 0.75, width: bounds.width / 4, height: bounds.height / 4)
		bottomRightDot.layer.cornerRadius = topLeftDot.frame.width / 2
		addSubview(topLeftDot)
		addSubview(bottomRightDot)
		animateTestDot()
	}

	private func animateTestDot() {
		let trackPath = UIBezierPath(arcCenter: CGPoint(x: bounds.maxX / 2, y: bounds.maxY / 2),
									 radius: bounds.width / 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
		let animation = CAKeyframeAnimation(keyPath: "position")
		animation.path = trackPath.cgPath
		animation.fillMode = .forwards
		animation.repeatCount = .infinity
		animation.duration = 2
		animation.autoreverses = false
		topLeftDot.layer.add(animation, forKey: "pathGuide")

		let trackPath2 = UIBezierPath(arcCenter: CGPoint(x: bounds.maxX / 2, y: bounds.maxY / 2),
									  radius: bounds.width / 4, startAngle: -.pi, endAngle: .pi, clockwise: true)
		let animation2 = CAKeyframeAnimation(keyPath: "position")
		animation2.path = trackPath2.cgPath
		animation2.fillMode = .forwards
		animation2.repeatCount = .infinity
		animation2.duration = 2
		animation2.autoreverses = false
		bottomRightDot.layer.add(animation2, forKey: "pathGuide")
	}

	private func animateDot() {
		let options: UIView.AnimationOptions = [.curveEaseInOut,
												.repeat,
												.autoreverse]

		UIView.animate(withDuration: 2.9,
					   delay: 0,
					   options: options,
					   animations: { [weak self] in
						self?.topLeftDot.frame.size.height *= 1.18
						self?.topLeftDot.frame.size.width *= 1.18
		}, completion: nil)
	}
}
