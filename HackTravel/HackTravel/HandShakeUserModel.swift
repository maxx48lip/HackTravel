//
//  HandShakeUserModel.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation

final class HandShakeUserModel {
	let name: String
	let surname: String
	let imageUrl: String

	init(name: String, surname: String, imageUrl: String) {
		self.name = name
		self.surname = surname
		self.imageUrl = imageUrl
	}
}
