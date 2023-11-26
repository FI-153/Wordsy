//
//  ScoreMaanger.swift
//  Wordsy
//
//  Created by Federico Imberti on 21/03/22.
//

import Foundation

class ScoreManager{
	@Published var wordsPerMinute:Float
	@Published var charsPerMinute:Int
	@Published var precision:Float
	
	private static let shared = ScoreManager()
	
	private init(){
		self.wordsPerMinute = 0
		self.charsPerMinute = 0
		self.precision = 100
	}
	
	static func getShared() -> ScoreManager {
		shared
	}
	
	func increaseWordsPerMinute(){
		wordsPerMinute += 1
	}
	
	func increaseCharsPerMinute(with word: String) {
		charsPerMinute += word.count
	}
	
	func updatePrecision(for typedWords: [Word]) {
		let correctWords = typedWords.filter { $0.wasTypedCorrecly }
		precision = round(Float(correctWords.count)/Float(typedWords.count) * 100)
	}
	
	func reset(){
		self.wordsPerMinute = 0
		self.charsPerMinute = 0
		self.precision = 100
	}
	
}
