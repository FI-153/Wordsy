//
//  WordsyTests.swift
//  WordsyTests
//
//  Created by Federico Imberti on 16/03/22.
//

import XCTest
@testable import Wordsy

class WordsyTests: XCTestCase {
	
	var wordManager:WordManager!

    override func setUpWithError() throws {
		self.wordManager = WordManager()
    }

    override func tearDownWithError() throws {
		self.wordManager = nil
    }
	
	func test_WordManager_init_allValuesInitialisedCorrectly() {
		//Given
		//When
		//Then
		assertEmpty(array: wordManager.typedWords)
		XCTAssertEqual(wordManager.nextWords.count, startingWords.count)
		XCTAssertEqual(wordManager.currentWord, startingWords.first!)
	}
	
	func test_WordManager_addToTypedWords_theCurrentWordIsAddedToTypedWords(){
		//Given
		//When
		wordManager.addToTypedWords()
		//Then
		XCTAssertEqual(wordManager.typedWords.first, wordManager.currentWord)
	}
	
	func test_WordManager_emptyTypedWords_theArrayIsEmptied(){
		//Given
		//When
		wordManager.emptyTypedWords()
		//Then
		assertEmpty(array: wordManager.typedWords)
	}
	
	func test_WordManager_removeFirstWordFromNext_theFirstWordIsRemovedFromNext(){
		//Given
		let firstWord = wordManager.nextWords.first!
		//When
		wordManager.removeFirstWordFromNextWords()
		//Then
		XCTAssertNotEqual(wordManager.nextWords.first!, firstWord)
	}
	
	func test_WordManager_getNewRandomWord_theNumberOfElementsInWordsIsUnchanged(){
		//Given
		let numberOfElements = wordManager.nextWords.count
		//When
		wordManager.removeFirstWordFromNextWords()
		wordManager.getNewRandomWord()
		//Then
		XCTAssertEqual(numberOfElements, wordManager.nextWords.count)
	}
	
	func assertEmpty <T> (array:[T]){
		XCTAssertTrue(array.isEmpty)
	}

}
