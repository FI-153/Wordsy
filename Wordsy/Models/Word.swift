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
			
    ///300 words of maximum 6 chracters without duplicates
    static let availableWords: [String] = ["apple", "happy", "breeze", "jolly", "music", "sunny", "candy", "laugh", "chirp", "lucky", "quick", "dream", "magic", "shine", "smile", "swift", "heart", "sugar", "cloud", "merry", "green", "peace", "funny", "sweet", "spark", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek", "happy", "sunny", "peace", "dream", "laugh", "sweet", "quick", "cloud", "music", "smile", "shine", "swift", "heart", "sugar", "green", "peace", "funny", "charm", "grace", "giddy", "cheer", "charm", "bliss", "vivid", "serene", "fresh", "clear", "quiet", "lively", "sleek"]
}
