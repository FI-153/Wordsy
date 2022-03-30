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
	@Binding var areStatisticsDisplayed:Bool
	@State var isSettingsViewDisplayed:Bool = false
	
	var body: some View {
		
		ZStack{
			goBackButtonSection
			
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
		.sheet(isPresented: $isSettingsViewDisplayed) {
			ResultsSettingView(isSettingsViewDisplayed: $isSettingsViewDisplayed, areStatisticsDisplayed: $areStatisticsDisplayed)
		}
	}
}

extension StatisticView {
	private var goBackButtonSection: some View {
		VStack {
			HStack{
				GoBackButtonView(usingVariable: $areStatisticsDisplayed)
				
				Spacer()
				
				Button {
					isSettingsViewDisplayed = true
				} label: {
					Image(systemName: "gearshape.fill")
						.resizable()
						.foregroundColor(.bgYellow)
						.frame(width: 50, height: 50)
				}
				.buttonStyle(.plain)

			}
			Spacer()
		}
		.padding()
	}
}

struct StatisticView_Previews: PreviewProvider {
	static var previews: some View {
		StatisticView(areStatisticsDisplayed: .constant(true))
			.preferredColorScheme(.light)
			.frame(width: 1000, height: 700)
	}
}
