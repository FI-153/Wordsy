//
//  WordViewModel.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Combine

class WordViewModel: ObservableObject {
	
	@Published var nextWords:[String] = []
	@Published var typedWords:[String] = []
	@Published var currentWord = ""
	
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
	
}
