//
//  ChainOfChainsCollectionView.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit

final class ChainOfChainsCollectionView: UICollectionView {

	var items: [ChainOfChainsItem]
	let reuseId = "reuseId1234"
	let layout = UICollectionViewFlowLayout()

	init(frame: CGRect) {
		items = []
		super.init(frame: frame, collectionViewLayout: layout)
		register(ChainOfChainsCell.self, forCellWithReuseIdentifier: reuseId)
		layout.itemSize = CGSize(width: 250, height: 400)
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 15
		layout.minimumInteritemSpacing = 300
		layout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
		dataSource = self
		allowsMultipleSelection = false
		showsHorizontalScrollIndicator = false
		showsVerticalScrollIndicator = false
		contentSize = CGSize(width: bounds.width, height: 1000)
		backgroundColor = .clear
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//Отвечаю, что там только ячейки ChainOfChainsCell
//swiftlint:disable force_cast
extension ChainOfChainsCollectionView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId,
													  for: indexPath) as! ChainOfChainsCell
		let item = items[indexPath.item]
		cell.singleChainCollectionView = item.collectionView

		return cell
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
}
