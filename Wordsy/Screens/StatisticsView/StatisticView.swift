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
	@StateObject var vm:StatisticViewModel

	init(areStatisticsDisplayed:Binding<Bool>){
		self._vm = .init(wrappedValue: StatisticViewModel(areStatisticsDisplayed: areStatisticsDisplayed))
	}
	
	var body: some View {
		
		ZStack{
			headerSection
			
			VStack {
				avgValuesSection
				resultsListSection
			}
		}
		.sheet(isPresented: $vm.isSettingsViewDisplayed) {
			ResultsSettingView(isSettingsViewDisplayed: $vm.isSettingsViewDisplayed, areStatisticsDisplayed: $vm.areStatisticsDisplayed)
		}
	}
}

extension StatisticView {
	private var headerSection: some View {
		VStack {
			HStack{
				GoBackButtonView(usingVariable: $vm.areStatisticsDisplayed)
				
				Spacer()
				
				Button {
					vm.isSettingsViewDisplayed = true
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
	
	private var resultsListSection: some View{
		List {
			ForEach(vm.fetchedResults) { result in
				ResultView(timestamp: result.timestamp ?? Date.distantPast,
						   wordsPm: result.wordsPm,
						   charsPm: result.charsPm,
						   precision: result.precision)
					.modifier(CenterModifier())
					.padding(.top)
			}
		}
		.listStyle(.plain)
		.frame(width: 680, height: 350)
		.clipShape(RoundedRectangle(cornerRadius: 30))
		.padding(.top)
	}
	
	private var avgValuesSection: some View{
		HStack(spacing: 50) {
			DataRectangleViewPadded(value: vm.getAvgWordsPm(), information: "words/min")
			DataRectangleViewPadded(value: vm.getAvgCharsPm(), information: "chars/min")
			DataRectangleViewPadded(value: vm.getAvgPrecision(), information: "precision")
		}
	}
}

struct StatisticView_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			BackgroundView()
			
			StatisticView(areStatisticsDisplayed: .constant(true))
				.preferredColorScheme(.light)
			.frame(width: 1000, height: 700)
		}
	}
}
