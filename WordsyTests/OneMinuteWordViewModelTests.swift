//
//  WordViewModelTest.swift
//  WordsyTests
//
//  Created by Federico Imberti on 16/03/22.
//

import XCTest
@testable import Wordsy

class OneMinuteWordViewModelTests: XCTestCase {

	var wordManager:WordManager!
	var vm:OneMinuteTestViewModel!

	override func setUpWithError() throws {
		self.wordManager = WordManager()
		self.vm = OneMinuteTestViewModel(isOneMinuteTestDisplayed: .constant(false))
	}

	override func tearDownWithError() throws {
		self.wordManager = nil
		self.vm = nil
	}
	
		
	func test_oneMinuteWordViewModelTests_init_teTypedWordIsEmpty(){
		//Given
		//When
		//Then
		XCTAssertTrue(vm.typedWord.isEmpty)
	}
	
	func test_oneMinuteWordViewModelTests_isTypedWordCorrect_theTypedWordIsCorrect(){
		//Given
		vm.wordManager.currentWord = Word("abc")
		//When
		vm.typedWord = "abc"
		//Then
		XCTAssertTrue(vm.isTypedWordCorrect())
	}
	
	func test_oneMinuteWordViewModelTests_isTypedWordCorrect_theTypedWordIsNotCorrect(){
		//Given
		vm.wordManager.currentWord = Word("abc")
		//When
		vm.typedWord = "abd"
		//Then
		XCTAssertFalse(vm.isTypedWordCorrect())
	}
	
	func test_oneMinuteWordViewModelTests_timerValueMinusOne_theTimerValueIsDecreasedByOne(){
		//Given
		let previosTimerValueMinusOne = vm.timerValue - 1
		//When
		vm.timerValueMinusOne()
		//Then
		XCTAssertEqual(vm.timerValue, previosTimerValueMinusOne)
	}
	
	func test_oneMinuteWordViewModelTests_resetTypedWord_theTypedWordIsResetted(){
		//Given
		//When
		vm.resetTypedWord()
		//Then
		XCTAssertTrue(vm.typedWord.isEmpty)
	}
	
	func test_oneMinuteWordViewModelTests_setAsCorrectlyTyped_theWordIsSetAsCorrectlyTyped(){
		vm.setAsCorrectlyTyped()
		XCTAssertTrue(vm.wordManager.currentWord.wasTypedCorrecly)
	}
	
	func test_oneMinuteWordViewModelTests_registerResults_resultIsCorrectelyCreatedAndAdjusted(){
		//Given
		vm.precision = 100
		vm.wordsPerMinute = 10
		vm.charsPerMinute = 100
		//When
		vm.registerResults()
		//Then
		XCTAssertEqual(10, vm.result!.wordsPm)
		XCTAssertEqual(100, vm.result!.charsPm)
	}
	
	func test_oneMinuteWordViewModelTests_registerResults_resultIsCorrectelyCreatedAndAdjustedForLowerPrecision(){
		//Given
		vm.precision = 50
		vm.wordsPerMinute = 10
		vm.charsPerMinute = 100
		//When
		vm.registerResults()
		//Then
		XCTAssertEqual(5, vm.result!.wordsPm)
		XCTAssertEqual(50, vm.result!.charsPm)
	}
}
