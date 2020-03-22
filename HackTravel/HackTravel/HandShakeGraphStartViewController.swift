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

	// MARK: - Life cycle

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: true)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
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
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Private methods

	private func setupUI() {
		[labelForFirstTextField, firstUserField,
		 labelForSecondTextField, secondUserField, startButton].forEach { addableView in
			addableView.translatesAutoresizingMaskIntoConstraints = false
			self.view.addSubview(addableView)
		}
		NSLayoutConstraint.activate([
			//Первое поле + лейблы
			labelForFirstTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
														constant: GlonalConstants.screenHeight * 0.2),
			labelForFirstTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
			labelForFirstTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
			labelForFirstTextField.heightAnchor.constraint(equalToConstant: 40),

			firstUserField.centerYAnchor.constraint(equalTo: labelForFirstTextField.centerYAnchor),
			firstUserField.leadingAnchor.constraint(equalTo: labelForFirstTextField.leadingAnchor, constant: 13),
			firstUserField.trailingAnchor.constraint(equalTo: labelForFirstTextField.trailingAnchor, constant: -13),

			//Второе поле + лейблы
			labelForSecondTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
														 constant: GlonalConstants.screenHeight * 0.4),
			labelForSecondTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
			labelForSecondTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
			labelForSecondTextField.heightAnchor.constraint(equalToConstant: 40),

			secondUserField.centerYAnchor.constraint(equalTo: labelForSecondTextField.centerYAnchor),
			secondUserField.leadingAnchor.constraint(equalTo: labelForSecondTextField.leadingAnchor, constant: 13),
			secondUserField.trailingAnchor.constraint(equalTo: labelForSecondTextField.trailingAnchor, constant: -13),

			//Кнопка старта
			startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
											 constant: GlonalConstants.screenHeight * 0.58),
			startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			startButton.widthAnchor.constraint(equalToConstant: 100),
			startButton.heightAnchor.constraint(equalToConstant: 40)
		])
	}
}
