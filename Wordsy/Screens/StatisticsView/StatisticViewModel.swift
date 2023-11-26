//
//  StatisticViewModel.swift
//  Wordsy
//
//  Created by Federico Imberti on 30/03/22.
//

import SwiftUI
import Foundation

class StatisticViewModel: ObservableObject {
	var db:PersistanceManager = PersistanceManager.getShared()
	
	@Published var fetchedResults:[SavedResult] = []
	@Published var isSettingsViewDisplayed:Bool = false
	@Binding var areStatisticsDisplayed:Bool

	init(areStatisticsDisplayed:Binding<Bool>){
		self._areStatisticsDisplayed = areStatisticsDisplayed
		fetchAllSavedResults()
	}
	
	func fetchAllSavedResults(){
		let request = NSFetchRequest<SavedResult>(entityName: "SavedResult")
		
		do {
			fetchedResults = try db.getContext().fetch(request)
			fetchedResults = fetchedResults.reversed()
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
	func getAvgWordsPm()-> Int {
		let sum = fetchedResults.reduce(0) {$0 + $1.wordsPm}
		
		if sum.isZero() { return 0 }
		
		return Int(Float(sum)/Float(fetchedResults.count))
	}
	
	func getAvgCharsPm()-> Int {
		let sum = fetchedResults.reduce(0) {$0 + $1.charsPm}
		
		if sum.isZero() { return 0 }
		
		return Int(Float(sum)/Float(fetchedResults.count))
	}
	
	func getAvgPrecision()-> Int {
		
		let sum = fetchedResults.reduce(0) {$0 + $1.precision}
		
		if sum.isZero() { return 0 }
		
		return  Int(Float(sum)/Float(fetchedResults.count))
	}
	
}
