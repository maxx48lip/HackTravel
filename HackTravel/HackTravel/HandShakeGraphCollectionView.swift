//
//  HandShakeGraphCollectionView.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit

final class HandShakeGraphCollectionView: UICollectionView {

	var items: [HandShakeGraphItem]
	let reuseId = "reuseId123"
	let layout = UICollectionViewFlowLayout()

	init(frame: CGRect) {
		items = [
			HandShakeGraphItem(name: "Имя", surname: "Фамилия", image: .red),
			HandShakeGraphItem(name: "Имя", surname: "Фамилия", image: .red),
			HandShakeGraphItem(name: "Имя", surname: "Фамилия", image: .red),
			HandShakeGraphItem(name: "Имя", surname: "Фамилия", image: .red),
			HandShakeGraphItem(name: "Имя", surname: "Фамилия", image: .red),
			HandShakeGraphItem(name: "Имя", surname: "Фамилия", image: .red),
			HandShakeGraphItem(name: "Имя", surname: "Фамилия", image: .red)
		]
		super.init(frame: frame, collectionViewLayout: layout)
		register(HandShakeGraphCell.self, forCellWithReuseIdentifier: reuseId)
		layout.itemSize = CGSize(width: 180, height: 60)
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 15
		layout.minimumInteritemSpacing = 300
		layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
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

//Гарантирую, что там только ячейки ChainOfChainsCell
//swiftlint:disable force_cast
extension HandShakeGraphCollectionView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId,
													  for: indexPath) as! HandShakeGraphCell
		let item = items[indexPath.item]

		cell.name = item.name
		cell.surname = item.surname
		cell.image = item.image

		return cell
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
}
