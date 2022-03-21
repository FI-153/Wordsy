//
//  WordViewModelTest.swift
//  WordsyTests
//
//  Created by Federico Imberti on 16/03/22.
//

import XCTest
@testable import Wordsy

class WordViewModelTest: XCTestCase {

	var wordManager:WordManager!
	var vm:WordViewModel!

	override func setUpWithError() throws {
		self.wordManager = WordManager()
		self.vm = WordViewModel()
	}

	override func tearDownWithError() throws {
		self.wordManager = nil
		self.vm = nil
	}
	
	func test_wordViewModel_subscribeToCurrentWord_thwTwoValuesAreTheSame(){
		//Given
		//When
		//Then
		XCTAssertEqual(wordManager.currentWord, vm.currentWord)
	}
	
	func test_wordViewModel_subscribeToTypedWords_thwTwoValuesAreTheSame(){
		//Given
		//When
		//Then
		XCTAssertEqual(wordManager.typedWords, vm.typedWords)
	}
	
//	func test_wordViewModel_subscribeToNextWords_thwTwoValuesAreTheSame(){
//		//Given
//		//When
//		//Then
//		XCTAssertEqual(wordManager.nextWords, vm.nextWords)
//	}
//
	
	func test_wordViewModel_init_teTypedWordIsEmpty(){
		//Given
		//When
		//Then
		XCTAssertTrue(vm.typedWord.isEmpty)
	}
	
	func test_wordViewModel_registerWord_theArraysAdjustsAndCurrentWordIsUpdated(){
		//Given
		let expectedCurrentWord = wordManager.showNextWord()
		let expectedFirstElementOfTypedWords = vm.currentWord
		let expectedFirstElementOfNextWords = vm.nextWords[1]
		//When
		vm.registerWord()
		//Then
		XCTAssertEqual(vm.currentWord, expectedCurrentWord)
		XCTAssertEqual(vm.typedWords.first, expectedFirstElementOfTypedWords)
		XCTAssertEqual(vm.nextWords.first, expectedFirstElementOfNextWords)
	}
	
	func test_wordViewModel_registerWord_newRandomWordAddedToNextWords(){
		//Given
		let expectedArrayLength = vm.nextWords.count
		//When
		vm.registerWord()
		//Then
		XCTAssertEqual(vm.nextWords.count, expectedArrayLength)
	}
	
	func test_wordViewModel_isTypedWordCorrect_theTypedWordIsCorrect(){
		//Given
		vm.currentWord = Word("abc")
		//When
		vm.typedWord = "abc"
		//Then
		XCTAssertTrue(vm.isTypedWordCorrect())
	}
	
	func test_wordViewModel_isTypedWordCorrect_theTypedWordIsNotCorrect(){
		//Given
		vm.currentWord = Word("abc")
		//When
		vm.typedWord = "abd"
		//Then
		XCTAssertFalse(vm.isTypedWordCorrect())
	}
	
	func test_wordViewModel_timerValueMinusOne_theTimerValueIsDecreasedByOne(){
		//Given
		let previosTimerValueMinusOne = vm.timerValue - 1
		//When
		vm.timerValueMinusOne()
		//Then
		XCTAssertEqual(vm.timerValue, previosTimerValueMinusOne)
	}
	
	func test_wordViewModel_resetTypedWord_theTypedWordIsResetted(){
		//Given
		//When
		vm.resetTypedWord()
		//Then
		XCTAssertTrue(vm.typedWord.isEmpty)
	}
}
