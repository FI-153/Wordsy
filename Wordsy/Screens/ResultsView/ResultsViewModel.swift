//
//  ResultsViewModel.swift
//  Wordsy
//
//  Created by Federico Imberti on 25/03/22.
//

import Foundation
import SwiftUI

class ResultsViewModel: ObservableObject {
	@Binding var isResultViewShown:Bool
	var result:TestResult
	
	init(isResultViewShown:Binding<Bool>, result:TestResult){
		self._isResultViewShown = isResultViewShown
		self.result = result
	}
	
	func saveResults(){
		result.addTo(PersistanceManager.getShared())
		isResultViewShown = false
	}
	
}
