//
//  WordsyTests.swift
//  WordsyTests
//
//  Created by Federico Imberti on 16/03/22.
//

import XCTest
@testable import Wordsy

class WordManagerTest: XCTestCase {
	
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
		XCTAssertEqual(wordManager.nextWords.count, Word.startingWords.count)
		XCTAssertEqual(wordManager.currentWord, Word.startingWords.first!)
	}
	
	func test_WordManager_initialise_allValuesInitialisedCorrectly() {
		//Given
		//When
		wordManager.initialise()
		//Then
		assertEmpty(array: wordManager.typedWords)
		XCTAssertEqual(wordManager.nextWords.count, Word.startingWords.count)
		XCTAssertEqual(wordManager.currentWord, Word.startingWords.first!)
	}
	
	func test_WordManager_showNextWord_theNextWordIsIssued(){
		//Given
		//When
		//Then
		XCTAssertEqual(wordManager.nextWords.first!, wordManager.showNextWord())
	}
	
	func test_WordManager_assignCurrentWordToNextWord_theNextWordIsAssignedToTheCurrent(){
		//Given
		//When
		wordManager.assignCurrentWordToNextWord()
		//Then
		XCTAssertEqual(wordManager.currentWord, wordManager.nextWords.first)
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
	
	func test_WordManager_emptyNextWords_theArrayIsEmptied(){
		//Given
		//When
		wordManager.emptyNextWords()
		//Then
		assertEmpty(array: wordManager.nextWords)
	}
	
	func test_WordManager_emptyCurrentWord_theCurrentWordIsEmptied(){
		//Given
		//When
		wordManager.emptyCurrentWord()
		//Then
		XCTAssertEqual(wordManager.currentWord, Word(.empty))
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
	
	func test_WordManager_assignANewWord_theAssignmentReflectsExpectedChanges(){
		//Given
		let expectedCurrentWord = wordManager.showNextWord()
		let expectedFirstElementOfNextWords = wordManager.nextWords[1]
		//When
		wordManager.assignANewWord()
		//Then
		XCTAssertEqual(wordManager.currentWord, expectedCurrentWord)
		XCTAssertEqual(wordManager.nextWords.first, expectedFirstElementOfNextWords)
	}
	
	func test_WordManager_assignANewWord_newRandomWordAddedToNextWords(){
		//Given
		let expectedArrayLength = wordManager.nextWords.count
		//When
		wordManager.assignANewWord()
		//Then
		XCTAssertEqual(wordManager.nextWords.count, expectedArrayLength)

	}
	
	func test_WordManager_setAsCorrectlyTyped_theCurrentWordIsSetAsCorrectlyTyped(){
		//Given
		//Given
		wordManager.setAsCorrectlyTyped()
		//Then
		XCTAssertTrue(wordManager.currentWord.wasTypedCorrecly)
	}
	
	func test_WordManager_setAsCorrectlyTyped_theWordAddedtoTheTypedWordsIsSetAsCorrectlyType(){
		//Given
		wordManager.currentWord = Word("abc")
		wordManager.setAsCorrectlyTyped()
		//When
		wordManager.assignANewWord()
		//Then
		XCTAssertTrue(wordManager.typedWords.first!.wasTypedCorrecly)
	}
	
	func assertEmpty <T> (array:[T]){
		XCTAssertTrue(array.isEmpty)
	}

}
