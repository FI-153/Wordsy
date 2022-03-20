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
	
	@Published var nextWords:[String]
	@Published var typedWords:[String]
	@Published var currentWord:String
	@Published var timerValue:Int
	@Published var timerIsRunning:Bool
	@Published var typedWord:String

	init(){
		self.nextWords = Array()
		self.typedWords = Array()
		self.currentWord = .empty
		self.typedWord = .empty
		self.timerIsRunning = false
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
	
	func correctWord(){
		wordManager.addToTypedWords()
		resetTypedWord()
		wordManager.assignANewWord()
	}
	
	func timerValueMinusOne(){
		timerValue = timerValue - 1
	}
	
	func resetTimer(){
		timerValue = 60
	}
	
	var timer = Timer.publish(every: 10000, tolerance: 0.5, on: .main, in: .common).autoconnect()

	func startTimer(){
		stopTimer()
		timerIsRunning = true
		timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
	}
	
	func stopTimer() {
		timer.upstream.connect().cancel()
		timerIsRunning = false
		resetTimer()
	}
	
	func resetTypedWord(){
		typedWord = .empty
	}
	
}
