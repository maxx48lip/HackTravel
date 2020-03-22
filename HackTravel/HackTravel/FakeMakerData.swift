//
//  FakeMakerData.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation

final class FakeMakerData {
	let sanya = HandShakeUserModel(name: "Саня",
								   surname: "Петров",
								   imageUrl: "https://sun9-65.userapi.com/c855428/v855428951/133d62/CJIm4GRvOiM.jpg")

	let max = HandShakeUserModel(name: "Макс",
							   	surname: "Павлов",
								imageUrl: "https://sun9-60.userapi.com/c836739/v836739483/11e0c/v9sVw7lv9fM.jpg")
	let valera = HandShakeUserModel(name: "Валера",
									surname: "Белов",
									imageUrl: "https://sun9-28.userapi.com/c844520/v844520398/1ff28c/VCCQasp9L2U.jpg")
	let anya = HandShakeUserModel(name: "Аня",
								  surname: "Зелениска",
								  imageUrl: "https://sun9-10.userapi.com/c205824/v205824565/67195/KxJk9zpVyYQ.jpg")
	let kirill = HandShakeUserModel(name: "Кирилл",
									surname: "Кузнецов",
									imageUrl: "https://sun9-8.userapi.com/c836632/v836632247/2c837/yEts-LtlgOo.jpg")
	let leha = HandShakeUserModel(name: "Леха",
								  surname: "Добросердов",
								  imageUrl: "https://sun9-69.userapi.com/c857720/v857720851/33f63/hBQ_pU2Y-Go.jpg")

	func makeFakeData() -> [[HandShakeUserModel]] {
		let testData = [[sanya, leha, max, valera, anya, kirill],
						[kirill, max, valera, leha, sanya, anya]]
		return testData
	}
}
