//
//  TimerManager.swift
//  Wordsy
//
//  Created by Federico Imberti on 20/03/22.
//

import Foundation
import Combine

class TimerManager{
	
	var timer = Timer.publish(every: 10000, on: .main, in: .common).autoconnect()
	var timerIsRunning:Bool = false
	
	static let shared = TimerManager()
	private init(){}
	
	static func getShared() -> TimerManager {
		shared
	}

	func startTimer(){
		stopTimer()
		timerIsRunning = true
		timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	}
	
	func stopTimer() {
		timer.upstream.connect().cancel()
		timerIsRunning = false
	}

}
