//
//  WordManager.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Foundation
import SwiftUI

class WordManager {
	@Published var currentWord:String = ""
	@Published var typedWords:[String] = []
	@Published var nextWords:[String] = []
	
	init(){
		self.nextWords = Words.startingWords
		assignANewWord()
	}
	
	func showNextWord() -> String {
		return nextWords.first!
	}
	
	func assignCurrentWordToNextWord(){
		currentWord = showNextWord()
	}
	
	func addToTypedWords() {
		typedWords.append(currentWord)
	}
	
	func emptyTypedWords(){
		typedWords.removeAll()
	}
	
	func removeFirstWordFromNextWords(){
		nextWords.remove(at: 0)
	}
	
	func getNewRandomWord(){
		nextWords.append(Words.words.randomElement()!)
	}
	
	func assignANewWord(){
		assignCurrentWordToNextWord()
		removeFirstWordFromNextWords()
		getNewRandomWord()
	}
	
}
