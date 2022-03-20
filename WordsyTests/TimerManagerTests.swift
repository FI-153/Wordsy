//
//  TimerManagerTests.swift
//  WordsyTests
//
//  Created by Federico Imberti on 20/03/22.
//

import XCTest
@testable import Wordsy

class TimerManagerTests: XCTestCase {
	
	let timerManager = TimerManager.getShared()
	
	override class func tearDown() {
		TimerManager.getShared().timer.upstream.connect().cancel()
	}

	func test_TimerManager_init_theTemporaryTimerIsCreated(){
		//Given
		let expectedTimeInterval = 10000
		//When
		//Then
		XCTAssertEqual(expectedTimeInterval, Int(timerManager.timer.upstream.interval))
	}
	
	func test_TimerManager_init_theTimerIsNotRunning(){
		//Given
		//When
		//Then
		XCTAssertTrue(!timerManager.timerIsRunning)
	}
	
	func test_TimerManager_startTimer_aOneSecondTimerIsCreated(){
		//Given
		let expectedInterval = 1
		//When
		timerManager.startTimer()

		//Then
		XCTAssertTrue(timerManager.timerIsRunning)
		XCTAssertEqual(Int(timerManager.timer.upstream.interval), expectedInterval)
	}
	
	func test_TimerManager_stopTimer_theTimerIsStopped(){
		//Given
		//When
		timerManager.stopTimer()
		//Then
		XCTAssertTrue(!timerManager.timerIsRunning)

	}

}
