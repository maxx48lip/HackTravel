//
//  HandShakeResultItemBuilder.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation

final class HandShakeResultItemBuilder {
	func makeItemsForResultCollectionFrom(data: [[HandShakeUserModel]]) -> [ChainOfChainsItem] {
		var resultItems: [ChainOfChainsItem] = []
		for chainOfUsers in data {
			var itemsWithUsers: [HandShakeGraphItem] = []
			for user in chainOfUsers {
				itemsWithUsers.append(HandShakeGraphItem(name: user.name,
														 surname: user.surname,
														 image: user.imageUrl))
			}
			let collectionWithChain = HandShakeGraphCollectionView(frame: .zero)
			collectionWithChain.items = itemsWithUsers
			resultItems.append(ChainOfChainsItem(collectionView: collectionWithChain))
		}
		return resultItems
	}
}
