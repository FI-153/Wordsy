//
//  ScoreManagerTests.swift
//  WordsyTests
//
//  Created by Federico Imberti on 21/03/22.
//

import XCTest
@testable import Wordsy

class ScoreManagerTests: XCTestCase {

	var scoreManager = ScoreManager.getShared()
	
	override func tearDown() {
		scoreManager.wordsPerMinute = 0
		scoreManager.charsPerMinute = 0
		scoreManager.precision = 100
	}
	
	func test_ScoreManager_increaseWordsPerMinute_wordsPerMinuteIsIncreasedByOne(){
		//Given
		let expectedWordsPerMinute = scoreManager.wordsPerMinute + 1
		//When
		scoreManager.increaseWordsPerMinute()
		//Then
		XCTAssertEqual(expectedWordsPerMinute, scoreManager.wordsPerMinute)
	}
	
	func test_ScoreManager_increaseCharsPerMinute_correctlyIncreased(){
		//Given
		let word = "Hello"
		let expectedLength = 5
		//When
		scoreManager.increaseCharsPerMinute(with: word)
		//Then
		XCTAssertEqual(expectedLength, scoreManager.charsPerMinute)
	}
	
	func test_ScoreManager_updatePrecision_precisionIs100Then50() {
		//Given
		var word = Word("abc")
		word.wasTypedCorrecly = true
		var words:[Word] = [word]
		//When
		scoreManager.increaseWordsPerMinute()
		scoreManager.updatePrecision(for: words)
		//Then
		XCTAssertEqual(Float(100), scoreManager.precision)
		
		//Given
		word.wasTypedCorrecly = false
		words.append(word)
		//When
		scoreManager.increaseWordsPerMinute()
		scoreManager.updatePrecision(for: words)
		//Then
		XCTAssertEqual(Float(50), scoreManager.precision)
	}
	
	func test_ScoreManager_updatePrecision_precisionIs33(){
		//Given
		var word = Word("abc")
		var words:[Word] = []
		
		//When
		word.wasTypedCorrecly = true
		words.append(word)
		scoreManager.increaseWordsPerMinute()
		scoreManager.updatePrecision(for: words)
		
		//When
		word.wasTypedCorrecly = false
		words.append(word)
		scoreManager.increaseWordsPerMinute()
		scoreManager.updatePrecision(for: words)

		//When
		word.wasTypedCorrecly = false
		words.append(word)
		scoreManager.increaseWordsPerMinute()
		scoreManager.updatePrecision(for: words)
		
		//Then
		XCTAssertEqual(Float(33), scoreManager.precision)
	}
	
	func test_ScoreManager_updatePrecision_precisionIsZero(){
		//Given
		var word = Word("abc")
		var words:[Word] = []
		word.wasTypedCorrecly = false
		words.append(word)
		//When
		scoreManager.updatePrecision(for: words)
		//Then
		XCTAssertEqual(0, scoreManager.precision)

	}

}
