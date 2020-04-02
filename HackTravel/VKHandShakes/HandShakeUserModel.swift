//
//  HandShakeUserModel.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation

final class HandShakeUserModel: Decodable {
	let lastName: String
	let name: String
	let photo: String
	let url: String
}

final class UserChain: Decodable {
	let user: HandShakeUserModel
}
