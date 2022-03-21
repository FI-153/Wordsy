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
	
	func removeFirstWordFromNextWords(){
		nextWords.remove(at: 0)
	}
	
	func getNewRandomWord(){
		nextWords.append(Word.words.randomElement()!)
	}
	
	func assignANewWord(){
		assignCurrentWordToNextWord()
		removeFirstWordFromNextWords()
		getNewRandomWord()
	}
	
}
