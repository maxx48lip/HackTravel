//
//  ChainOfChainsCell.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation
import UIKit

final class ChainOfChainsCell: UICollectionViewCell {
	var singleChainCollectionView: UICollectionView? {
		didSet {
			collectionView = singleChainCollectionView
		}
	}

	private var collectionView: UICollectionView? {
		didSet {
			setupConstraints()
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		collectionView?.removeFromSuperview()
	}

	private func setupConstraints() {
		clipsToBounds = false
		layer.cornerRadius = 20
		layer.borderColor = UIColor.black.cgColor
		layer.borderWidth = 0.5
		guard let collectionView = collectionView else { return }
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(collectionView)
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
