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
	
	func test_wordViewModel_subscribeToNextWords_thwTwoValuesAreTheSame(){
		//Given
		//When
		//Then
		XCTAssertEqual(wordManager.nextWords, vm.nextWords)
	}
}
