//
//  WordViewModel.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Combine
import Foundation

class WordViewModel: ObservableObject {
	
	@Published var nextWords:[String] = []
	@Published var typedWords:[String] = []
	@Published var currentWord = ""
	@Published var timerValue = 60
	
	let wordManager = WordManager()
	var cancellables = Set<AnyCancellable>()

	init(){
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
		wordManager.assignANewWord()
	}
	
	func timerValueMinusOne(){
		timerValue = timerValue - 1
	}
	
	func resetTimer(){
		timerValue = 60
	}
	
	var timer:Publishers.Autoconnect<Timer.TimerPublisher>?

	func startTimer(){
		self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	}
	
	func stopTimer() throws {
		
		if let timer = self.timer {
			timer.upstream.connect().cancel()
			resetTimer()
		} else {
			throw timerError.noTimerError("There is no timer to stop")
		}
		
	}
	
	enum timerError: Error {
		case noTimerError(String)
	}
	
}
