//
//  Extensions.swift
//  Wordsy
//
//  Created by Federico Imberti on 20/03/22.
//

import Foundation
import SwiftUI

extension String {
	static let empty = String()
	
	func toDots() -> String {
		return String(repeating: "•", count: self.count)
	}
}

extension Color {
	static let bgYellow = Color.init(red: 0.8833333253860474, green: 0.7950000762939453, blue: 0)
}

extension Int {
	func adjusted(by adjustmentFactor:Float) -> Int {
		return Int(Float(self)*adjustmentFactor)
	}
}

extension Int16 {
	func isZero() -> Bool {
		return self == 0
	}
}

extension Text {
	func strikethrough(_ isTrue:Bool) -> Text {
		if isTrue{
			return self.strikethrough()
		}
		return self
	}
}
