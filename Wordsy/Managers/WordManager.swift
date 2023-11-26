//
//  WordManager.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Foundation
import SwiftUI

class WordManager {
	@Published var currentWord:Word
	@Published var typedWords:[Word]
	@Published var nextWords:[Word]
	
	init(){
        currentWord = Word(.empty)
        typedWords = []
        nextWords = []
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
	
	private func assignCurrentWordToNextWord(){
		currentWord = getNextWord()
	}
	
	private func addToTypedWords() {
		typedWords.append(currentWord)
	}
	
	private func emptyTypedWords(){
		typedWords.removeAll()
	}
	
	private func emptyNextWords(){
		nextWords.removeAll()
	}
	
	private func emptyCurrentWord(){
		currentWord = Word(.empty)
	}
	
	func reset(){
		emptyNextWords()
		emptyTypedWords()
		emptyCurrentWord()
	}
	
	private func removeFirstWordFromNextWords(){
		nextWords.remove(at: 0)
	}
	
	private func getNewRandomWord(){
		nextWords.append(Word(Word.words[Int.random(in: 0..<Word.words.count)]))
	}
	
	private func initiliseNextWords(){
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
