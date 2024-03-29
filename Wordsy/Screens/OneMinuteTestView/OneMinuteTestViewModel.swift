//
//  WordViewModel.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import Combine
import Foundation
import SwiftUI

class OneMinuteTestViewModel: ObservableObject {
	
	 let wordManager = WordManager()
	private let scoreManager = ScoreManager.getShared()
	private var cancellables = Set<AnyCancellable>()
	
#if DEBUG
	private let standardTimerValue = 5
#else
	private let standardTimerValue = 60
#endif
	
	@Published var timerValue:Int
	@Published var typedWord:String
	@Published var wordsPerMinute:Int
	@Published var charsPerMinute:Int
	@Published var precision:Int
	@Published var result:TestResult?
	@Published var isResultViewShown:Bool
	@Published var difficulty:WordsyDifficulty
	
	@Binding var isOneMinuteTestDisplayed:Bool

	init(isOneMinuteTestDisplayed:Binding<Bool>){
		self.typedWord = .empty
		self.timerValue = standardTimerValue
		self.wordsPerMinute = 0
		self.charsPerMinute = 0
		self.precision = 100
		self.isResultViewShown = false
		self.difficulty = .easy
		self._isOneMinuteTestDisplayed = isOneMinuteTestDisplayed

		subscribeToWordsPerMinute()
		subscribeToCharsPerMinute()
		subscribeToPrecision()
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
		if typedWord.hasSuffix(" "){
			typedWord.removeLast()
		}
		
		return typedWord == wordManager.currentWord.getValue()
	}
	
	func timerValueMinusOne(){
		timerValue = timerValue - 1
	}
	
	func resetTimerValue(){
		timerValue = standardTimerValue
	}
	
	let timerManager = TimerManager.getShared()
	
	func startTimerIfNoneAreActive(){
		if timerValue == standardTimerValue && !timerManager.timerIsRunning {
			timerManager.startTimer()
		}
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
		scoreManager.increaseCharsPerMinute(with: wordManager.currentWord.getValue())
		scoreManager.updatePrecision(for: wordManager.typedWords)
	}
	
	func registerCorrectWord(){
		setAsCorrectlyTyped()
		registerWord()
		updateScore()
	}
	
	func registerWrongWord(){
		registerWord()
		updateScore()
	}
	
	func registerResults(){
		let adjustemtFactor = Float(precision)/100
		
		self.result = TestResult(timestamp: Date(),
							 wordsPm: wordsPerMinute.adjusted(by: adjustemtFactor),
							 charsPm: charsPerMinute.adjusted(by: adjustemtFactor),
							 precision: precision)
		
		self.isResultViewShown = true
	}
	
	func reset(){
		result = nil
		wordManager.reset()
		scoreManager.reset()
		wordManager.initialise()
	}
	
	func checkSpelling(of wordBeingTyped:String){
		
		if wordBeingTyped.isEmpty {
			startTimerIfNoneAreActive()
		}
		
		if wordBeingTyped.contains(" ") {
			if isTypedWordCorrect() {
				registerCorrectWord()
			} else {
				registerWrongWord()
			}
		}
	}
	
	func updateTimer(){
		if timerValue == 0 {
			stopTimer()
			registerResults()
		} else {
			timerValueMinusOne()
		}
	}
	
}
