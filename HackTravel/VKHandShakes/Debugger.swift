//
//  Debugger.swift
//  HackComponents
//
//  Created by Max Pavlov on 22/12/2019.
//  Copyright © 2019 Pavlov Max. All rights reserved.
//

import Foundation

/// Дебаггер
enum Debugger {

	/// Тип логгирования
	enum LogType: String {
		case info = "ℹ️ℹ️ℹ️ [Info] - "
		case error = "⛔️❌🆘 [Error] - "
		case magic = "🌈🎉🧚‍♀️ [Magic] - "
	}

	/// Функция для логгирования
	///
	/// - Parameters:
	///   - type: тип логгирования
	///   - logString: строка логгирования
	static func log(type: LogType, logString: String?) {
		let prefix = type.rawValue
		let mainLogString = logString ?? "Trolling expected"
		let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .medium)
		let emptyString = "\n"
		let suffix = "🕑 "

		let result = prefix + mainLogString + emptyString + suffix + timestamp

		// swiftlint:disable:next disable_print
		print(result)
	}
}
