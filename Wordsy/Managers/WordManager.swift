//
//  WordManager.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Foundation
import SwiftUI

class WordManager {
	@Published var currentWord:Word = Word(.empty)
	@Published var typedWords:[Word] = []
	@Published var nextWords:[Word] = []
	
	init(){
		initialise()
	}
	
	func initialise(){
		reset()
		self.nextWords = Word.startingWords
		assignANewWord()
	}
	
	func showNextWord() -> Word {
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
	
	func emptyNextWords(){
		nextWords.removeAll()
	}
	
	func emptyCurrentWord(){
		currentWord = Word(.empty)
	}
	
	func reset(){
		emptyNextWords()
		emptyTypedWords()
		emptyCurrentWord()
	}
	
	func removeFirstWordFromNextWords(){
		nextWords.remove(at: 0)
	}
	
	func getNewRandomWord(){
		nextWords.append(Word.words.randomElement()!)
	}
	
	func assignANewWord(){
		if !currentWord.value.isEmpty {
			addToTypedWords()
		}
		assignCurrentWordToNextWord()
		removeFirstWordFromNextWords()
		getNewRandomWord()
	}
	
	func setAsCorrectlyTyped(){
		self.currentWord.wasTypedCorrecly = true
	}
}
