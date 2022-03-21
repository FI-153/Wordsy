//
//  Word.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Foundation

struct Word: Identifiable, Hashable{
	
	let value:String
	let wasTypedCorrecly:Bool
	let id:UUID
	
	init(_ value:String){
		self.id = UUID()
		self.value = value
		self.wasTypedCorrecly = true
	}
	
	static func == (lhs: Word, rhs: Word) -> Bool {
		lhs.id == rhs.id
	}
	
	static let words:[Word] = [
		Word("Commander"),
		Word("Leutenant"),
		Word("Enseign"),
		Word("Picard"),
		Word("Archer"),
		Word("Sisko"),
		Word("Enterprise"),
		Word("Voyager"),
		Word("DS9"),
		Word("ncc-1701-d"),
		Word("Miranda"),
		Word("Sovereign"),
		Word("Galaxy"),
		Word("Defiant"),
		Word("Intrepid"),
		Word("Captain"),
	]
	
	static let startingWords:[Word] = [
		Word("Enterprise"),
		Word("Voyager"),
		Word("DS9"),
		Word("ncc-1701-d"),
		Word("Miranda"),
		Word("Sovereign"),
		Word("Galaxy"),
		Word("Defiant"),
		Word("Intrepid"),
		Word("Captain"),
	]
}
