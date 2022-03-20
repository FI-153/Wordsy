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
	@Published var currentWord:String = .empty
	@Published var timerValue = 60
	@Published var typedWord:String = .empty
	
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
		timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
	}
	
	func stopTimer() {
		timer.upstream.connect().cancel()
		resetTimer()
	}
	
	func resetTypedWord(){
		typedWord = .empty
	}
	
}
