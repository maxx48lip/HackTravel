//
//  HandShakeGraphItem.swift
//  HackTravel
//
//  Created by Max Pavlov on 21/03/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import UIKit
final class HandShakeGraphItem {

	var name: String
	var surname: String
	var image: UIColor

	init(name: String, surname: String, image: UIColor) {
		self.name = name
		self.surname = surname
		self.image = image
	}
}
