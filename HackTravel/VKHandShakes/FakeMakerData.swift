//
//  FakeMakerData.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation

final class FakeMakerData {
	func makeFakeData() -> [ChainsModel] {
		guard
			let path = Bundle.main.path(forResource: "Files/testChain", ofType: "json"),
			let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
			let infoData = try? JSONDecoder().decode(APIResponseModel.self, from: jsonData),
			let result = infoData.result
			else {
				Debugger.log(type: .error, logString: "Fake Data can not be maked")
				return []
		}
		return result
	}
}
