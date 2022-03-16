//
//  WordManager.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Cocoa

class WordManager {
	var currentWord:String = ""
	var typedWords:[String] = []
	var nextWords:[String] = []
	
	init(){
		self.nextWords = startingWords
		self.currentWord = showNextWord()
	}
	
	func showNextWord() -> String {
		return nextWords.first!
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
		nextWords.append(words.randomElement()!)
	}
	
}
