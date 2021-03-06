//
//  HandShakeGraphStartViewController+Constraints.swift
//  VKHandShakes
//
//  Created by Max Pavlov on 01/04/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

extension HandShakeGraphStartViewController {

	func setupUI() {
		[labelForFirstTextField, firstUserField,
		 labelForSecondTextField, secondUserField, loadingView, startButton,
		 testApiView].forEach { addableView in
			addableView.translatesAutoresizingMaskIntoConstraints = false
			self.view.addSubview(addableView)
		}
		NSLayoutConstraint.activate([
			//TestApiView
			testApiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			testApiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			testApiView.widthAnchor.constraint(equalToConstant: 15),
			testApiView.heightAnchor.constraint(equalToConstant: 15),
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
			startButton.heightAnchor.constraint(equalToConstant: 40),
			//LoadingView
			loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			loadingView.centerYAnchor.constraint(equalTo: startButton.centerYAnchor),
			loadingView.widthAnchor.constraint(equalToConstant: 100),
			loadingView.heightAnchor.constraint(equalToConstant: 100)
		])
		loadingView.isHidden = true
		startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
	}

	@objc func startButtonAction() {
		startButton.isHidden = true
		loadingView.isHidden = false
		//GlobalCoordinator.open(.handShakeResultViewController(chains: FakeMakerData().makeFakeData()))
		loadJson(completion: { chains in GlobalCoordinator.open(.handShakeResultViewController(chains: chains)) })
	}

	private func loadJson(completion: @escaping ([ChainsModel]) -> Void) {
		BaseChain.makeRequest(type: .handshake(user1: firstUserField.text ?? "136861066",
											   user2: secondUserField.text ?? "inchillwetrust",
											   serverInDebugMode: true),
							  completion: { [weak self] data in

			Debugger.log(type: .magic, logString: "\(String(data: data ?? Data(), encoding: .utf8) ?? "nil")")
								if let data = data,
									let model = try? JSONDecoder().decode(APIResponseModel.self, from: data),
									let chains = model.result {
									completion(chains)
									Debugger.log(type: .magic, logString: "\(String(data: data, encoding: .utf8) ?? "nil")")
								} else {
									Debugger.log(type: .error, logString: "Response Data is nil")
									AlertsAssembly.showErrorAlert(type: .unknown)
								}
								DispatchQueue.main.async {
									self?.startButton.isHidden = false
									self?.loadingView.isHidden = true
								}
		})
	}
}
