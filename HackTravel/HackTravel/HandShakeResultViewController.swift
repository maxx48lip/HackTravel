//
//  ViewController.swift
//  HackTravel
//
//  Created by Max Pavlov on 14/01/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit

final class HandShakeResultViewController: UIViewController {

	//let testcollection = HandShakeGraphCollectionView(frame: .zero)
	let testcollection = ChainOfChainsCollectionView(frame: .zero)

	// MARK: LifeCycle

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		Debugger.log(type: .info, logString: "Загрузились вьюхи")

		BaseChain.makeRequest(type: .test, completion: { data in
			Debugger.log(type: .magic, logString: "\(String(data: data ?? Data(), encoding: .utf8) ?? "nil")")
		})
		//testLoadingView()
		setupHandShakeGraphCollection()
	}

	// MARK: - Private methods

	private func setupHandShakeGraphCollection() {
		view.addSubview(testcollection)
		testcollection.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			testcollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: testcollection.bottomAnchor),
			testcollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			testcollection.leadingAnchor.constraint(equalTo: view.leadingAnchor)])
	}
//	private func testLoadingView() {
//		let circularView = CircularProgressView()
//		circularView.center = view.center
//		let duration = 1.0
//		circularView.progressAnimation(duration: duration)
//		view.addSubview(circularView)
//	}

}

// MARK: - UICollectionViewDelegateFlowLayout
