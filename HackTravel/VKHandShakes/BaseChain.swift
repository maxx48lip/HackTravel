//
//  BaseChain.swift
//  HackTravel
//
//  Created by Max Pavlov on 18/01/2020.
//  Copyright © 2020 Pavlov Max. All rights reserved.
//

import Foundation

/// Сетевой чейн
enum BaseChain {

	/// Тип запроса(url)
	///
	/// - test: тестовый url
	enum RequestType {
		case test
		case testApi
		case handshake(user1: String, user2: String, serverInDebugMode: Bool = false)

		var requestUrl: String {
			//let serverAdress = "http://localhost:8088"
			let serverAdress = "http://77.246.158.24:8088"
			switch self {
			case .test:
				return "https://httpbin.org/get"
			case .testApi:
				return serverAdress
			case let .handshake(user1: user1, user2: user2, serverInDebugMode: debugMode):
				return serverAdress + "/?method=handshake&users=\(user1),\(user2)&shouldUseDebug=\(debugMode)"
			}
		}
	}

	/// Сделать get-запрос на сервер
	///
	/// - Parameters:
	///   - type: Тип запроса(url)
	///   - completion: Комплишн блок с данными
	static func makeRequest(type: RequestType, completion: @escaping (Data?) -> Void) {
		Debugger.log(type: .info, logString: "Запуск BaseChain")
		let url = URL(string: type.requestUrl)!
		let task = URLSession.shared.dataTask(with: url) { data, response, error in
			Debugger.log(type: .info, logString: "Попытка выполнить запрос: " + type.requestUrl)

			if let error = error {
				Debugger.log(type: .error, logString: "error: \(error.localizedDescription)")
				completion(nil)
			} else {

				guard let response = response as? HTTPURLResponse else {
					Debugger.log(type: .error, logString: "Response = nil")
					completion(nil)
					return
				}

				if (200...299).contains(response.statusCode) {
					Debugger.log(type: .info, logString: "statusCode: \(response.statusCode)")
				} else {
					Debugger.log(type: .error, logString: "statusCode: \(response.statusCode)")
				}

				if response.mimeType != "application/json" {
					Debugger.log(type: .error,
								 logString: "Wrong MIME type! Expected JSON, but ontained \(String(describing: response.mimeType))")
				}

				if let data = data {
					Debugger.log(type: .info, logString: "Data downloading completed")
					completion(data)
					return
				}

				Debugger.log(type: .error, logString: "Data downloading finished with error")
				completion(nil)
			}
		}
		task.resume()
	}
}
