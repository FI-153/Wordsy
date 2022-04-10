//
//  Word.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Foundation

struct Word: Identifiable, Hashable{
	
	let value:String
	var wasTypedCorrecly:Bool
	let id:UUID
	
	init(_ value:String){
		self.id = UUID()
		self.value = value
		self.wasTypedCorrecly = false
	}
	
	static func == (lhs: Word, rhs: Word) -> Bool {
		lhs.value == rhs.value
	}
			
	static let words:[String] = [
		"Commander",
		"Leutenant",
		"Enseign",
		"Picard",
		"Archer",
		"Sisko",
		"Enterprise",
		"Voyager",
		"DS9",
		"Miranda",
		"Sovereign",
		"Galaxy",
		"Defiant",
		"Intrepid",
		"Captain",
	]
	
}
