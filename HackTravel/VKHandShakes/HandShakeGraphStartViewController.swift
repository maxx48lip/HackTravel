//
//  HandShakeGraphStartViewController.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit

final class HandShakeGraphStartViewController: UIViewController {

	let builder = HandShakeGraphStartBuilder()
	let firstUserField: UITextField
	let labelForFirstTextField: UILabel
	let secondUserField: UITextField
	let labelForSecondTextField: UILabel
	let startButton: UIButton
	let testApiView = TestApiView()
	let loadingView = LoadingView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

	// MARK: - Life cycle

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: true)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		testApiView.checkApi()
		firstUserField.delegate = self
		secondUserField.delegate = self
		view.backgroundColor = .white
		setupUI()
	}

	// MARK: - Initializers

	init() {
		self.firstUserField = builder.makeTextField1()
		self.secondUserField = builder.makeTextField2()
		self.labelForFirstTextField = builder.makeLabelForTextField()
		self.labelForSecondTextField = builder.makeLabelForTextField()
		self.startButton = builder.makeStartButton()
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Private methods

}

extension HandShakeGraphStartViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return false
	}
}
