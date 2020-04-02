//
//  HandShakeGraphStartViewController.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit
import Lottie

final class HandShakeGraphStartViewController: UIViewController {

	let builder = HandShakeGraphStartBuilder()
	let firstUserField: UITextField
	let labelForFirstTextField: UILabel
	let secondUserField: UITextField
	let labelForSecondTextField: UILabel
	let startButton: UIButton
	let loadingAnimationView: AnimationView
	let testApiView = TestApiView()

	// MARK: - Life cycle

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		AlertsAssembly.showErrorAlert(type: .m1, description: nil)
		navigationController?.setNavigationBarHidden(true, animated: true)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		testApiView.checkApi()
		view.backgroundColor = .white
		setupUI()
	}

	// MARK: - Initializers

	init() {
		self.firstUserField = builder.makeTextField()
		self.secondUserField = builder.makeTextField()
		self.labelForFirstTextField = builder.makeLabelForTextField()
		self.labelForSecondTextField = builder.makeLabelForTextField()
		self.startButton = builder.makeStartButton()
		self.loadingAnimationView = builder.makeAnimView()
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Private methods

}
