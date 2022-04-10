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
		initiliseNextWords()
		assignANewWord()
	}
	
	func getNextWord() -> Word {
		return nextWords.first!
	}
	
	func assignCurrentWordToNextWord(){
		currentWord = getNextWord()
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
		nextWords.append(Word(Word.words[Int.random(in: 0..<Word.words.count)]))
	}
	
	func initiliseNextWords(){
		for _ in 0...9 {
			getNewRandomWord()
		}
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
