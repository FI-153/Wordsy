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
	private let scoreManager = ScoreManager.getShared()
	private var cancellables = Set<AnyCancellable>()
	private let standardTimerValeue = 60
	
	@Published var nextWords:[Word]
	@Published var typedWords:[Word]
	@Published var currentWord:Word
	@Published var timerValue:Int
	@Published var typedWord:String
	@Published var wordsPerMinute:Int
	@Published var charsPerMinute:Int
	@Published var precision:Int

	init(){
		self.nextWords = Array()
		self.typedWords = Array()
		self.currentWord = Word(.empty)
		self.typedWord = .empty
		self.timerValue = standardTimerValeue
		self.wordsPerMinute = 0
		self.charsPerMinute = 0
		self.precision = 100

		subscribeToCurrentWord()
		subscribeToTypedWords()
		subscribeToNextWords()
		subscribeToWordsPerMinute()
		subscribeToCharsPerMinute()
		subscribeToPrecision()
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
	
	func subscribeToWordsPerMinute(){
		scoreManager.$wordsPerMinute.sink { newValue in
			self.wordsPerMinute = Int(newValue)
		}
		.store(in: &cancellables)
	}
	
	func subscribeToCharsPerMinute(){
		scoreManager.$charsPerMinute.sink { newValue in
			self.charsPerMinute = newValue
		}
		.store(in: &cancellables)
	}
	
	func subscribeToPrecision(){
		scoreManager.$precision.sink { newValue in
			self.precision = Int(newValue)
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
	
	func startTimerIfNoneAreActive(){
		if timerValue == 60 && !timerManager.timerIsRunning { timerManager.startTimer() }
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
	
	func updateScore() {
		scoreManager.increaseWordsPerMinute()
		scoreManager.increaseCharsPerMinute(with: currentWord.value)
		scoreManager.updatePrecision(for: typedWords)
	}
	
}
