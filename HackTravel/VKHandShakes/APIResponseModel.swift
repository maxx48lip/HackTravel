//
//  APIResponseModel.swift
//  VKHandShakes
//
//  Created by Max Pavlov on 01/04/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation

/// Модель ответов сервера
struct APIResponseModel: Decodable {
	let resultCode: Int
	let resultDescription: String
	let result: AnyObject?

	private enum CodingKeys: String, CodingKey {
		case resultCode
		case resultDescription
		case result
	}

	/// #ResultCodes and Description
	///
	///	#SuccessCodes:
	/// `0` - Success with nothing (API is alive)
	/// `1` - Success For main Request (HandShakes)
	///
	///	#Error Codes:
	/// `-1` - Can not resolve request with this paramters
	/// `-2` - Calculation error (For main Request - HandShakes)

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let code = Int(try container.decode(String.self, forKey: .resultCode)) ?? -666
		self.resultCode = code
		if code < 0 {
			let type: AlertsAssembly.ErrorAlertType = AlertsAssembly.mapTypes[code] ?? .unknown
			AlertsAssembly.showErrorAlert(type: type)
		}
		self.resultDescription = try container.decode(String.self, forKey: .resultDescription)
		if resultCode == 1 {
			result = try container.decode(HandShakeUserModel.self, forKey: .result)
		} else {
			result = nil
		}
	}
}
