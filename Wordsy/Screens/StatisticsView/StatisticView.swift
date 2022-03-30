//
//  StatisticsView.swift
//  Wordsy
//
//  Created by Federico Imberti on 30/03/22.
//

import Foundation
import SwiftUI
import CoreData

struct StatisticView: View {
	@StateObject var vm = StatisticViewModel()
	
	var body: some View {
		
		VStack {
			Text("Average Values")
				.font(.largeTitle)
			
			HStack(spacing: 50) {
				DataRectangleViewPadded(value: vm.getAvgWordsPm(), information: "words/min")
				DataRectangleViewPadded(value: vm.getAvgCharsPm(), information: "chars/min")
				DataRectangleViewPadded(value: vm.getAvgPrecision(), information: "precision")
			}
		}
	}
}

struct StatisticView_Previews: PreviewProvider {
	static var previews: some View {
		StatisticView()
	}
}
