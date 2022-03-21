//
//  WordViewModel.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Combine
import Foundation

class WordViewModel: ObservableObject {
	
	private let wordManager = WordManager()
	private var cancellables = Set<AnyCancellable>()
	private let standardTimerValeue = 60
	
	@Published var nextWords:[Word]
	@Published var typedWords:[Word]
	@Published var currentWord:Word
	@Published var timerValue:Int
	@Published var typedWord:String

	init(){
		self.nextWords = Array()
		self.typedWords = Array()
		self.currentWord = Word(.empty)
		self.typedWord = .empty
		self.timerValue = standardTimerValeue

		subscribeToCurrentWord()
		subscribeToTypedWords()
		subscribeToNextWords()
	}
	
	func subscribeToCurrentWord(){
		wordManager.$currentWord.sink { newCurrentWord in
			self.currentWord = newCurrentWord
		}
		.store(in: &cancellables)
	}
	
	func subscribeToTypedWords(){
		wordManager.$typedWords.sink { typedWords in
			self.typedWords = typedWords
		}
		.store(in: &cancellables)
	}
	
	func subscribeToNextWords(){
		wordManager.$nextWords.sink { nextWords in
			self.nextWords = nextWords
		}
		.store(in: &cancellables)
	}
	
	func registerWord(){
		resetTypedWord()
		wordManager.assignANewWord()
	}
	
	func isTypedWordCorrect() -> Bool {
		return typedWord == currentWord.value
	}
	
	func timerValueMinusOne(){
		timerValue = timerValue - 1
	}
	
	func resetTimerValue(){
		timerValue = 60
	}
	
	let timerManager = TimerManager.getShared()
	
	func startTimer(){
		timerManager.startTimer()
	}
	
	func stopTimer() {
		timerManager.stopTimer()
		resetTimerValue()
	}
	
	func resetTypedWord(){
		typedWord = .empty
	}
	
	func setAsCorrectlyTyped(){
		wordManager.setAsCorrectlyTyped()
	}
	
}
