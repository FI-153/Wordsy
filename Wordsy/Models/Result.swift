//
//  Result.swift
//  Wordsy
//
//  Created by Federico Imberti on 23/03/22.
//

import Foundation

struct Result: Identifiable {
	
	let id = UUID()
	let timestamp:Date
	let wordsPm:Int
	let charsPm:Int
	let precision:Int
	
}
