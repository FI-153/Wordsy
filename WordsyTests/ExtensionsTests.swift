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

}
