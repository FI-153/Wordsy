//
//  ExtensionsTests.swift
//  WordsyTests
//
//  Created by Federico Imberti on 23/03/22.
//

import XCTest
@testable import Wordsy

class ExtensionsTests: XCTestCase {

	func test_Extensions_String_emptyStringIsCreated(){
		//Given
		let emptyString = ""
		//When
		let emptyStringByExtension = String.empty
		//Then
		XCTAssertEqual(emptyString, emptyStringByExtension)
	}
	
	func test_Extensions_String_toAsterisk_theWordIsTurnedInAsterisks(){
		//Given
		let stringToConvert = "hello"
		let expectedString = "•••••"
		//When
		let stringConverted = stringToConvert.toDots()
		//Then
		XCTAssertEqual(expectedString, stringConverted)
	}
	
	func test_Extensions_Int_adjusted_theValueIsAdjustedByTheGivenFactor_stress(){
		for number in 1...10 {
			//Given
			let adjustmentFactor = Float.random(in: 0...1)
			let expectedValue = Int(Float(number)*adjustmentFactor)
			
			//When
			let adjustedValue = number.adjusted(by: adjustmentFactor)
			
			//Then
			XCTAssertEqual(expectedValue, adjustedValue)
		}
	}
	
	func test_Extensions_Int16_isZero_theGivenNumberIsZero() {
		//Given
		let zero:Int16 = 0
		//When
		let isZero = zero.isZero()
		//Then
		XCTAssertTrue(isZero)
	}
	
	func test_Extensions_Int16_isZero_theGivenNumberIsNotZero() {
		//Given
		let zero:Int16 = 1
		//When
		let isZero = zero.isZero()
		//Then
		XCTAssertFalse(isZero)
	}

}
