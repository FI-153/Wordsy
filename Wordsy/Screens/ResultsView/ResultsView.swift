//
//  ResultsView.swift
//  Wordsy
//
//  Created by Federico Imberti on 23/03/22.
//

import SwiftUI

struct ResultsView: View {
	
	@StateObject var vm:ResultsViewModel
	init(result:TestResult, isResultViewShown:Binding<Bool>){
		self._vm = .init(wrappedValue: ResultsViewModel(isResultViewShown: isResultViewShown, result: result))
	}
	
    var body: some View {
		VStack {
			Spacer()
			
			titleSection
			
			Spacer()
			
			resultsSection
			
			Spacer()
			
			buttonsSection
			
			Spacer()
		}
		.frame(width: 600, height: 400)
    }
}

extension ResultsView {
	private var titleSection: some View {
		Text("Great job!")
			.font(.system(size: 30, weight: .medium))
	}
	
	private var resultsSection: some View{
		HStack(spacing: 15){
			DataRectangleViewPadded(value: vm.result.wordsPm, information: "Words/min")
			DataRectangleViewPadded(value: vm.result.charsPm, information: "Chars/min")
			DataRectangleViewPadded(value: vm.result.precision, information: "% acccuracy")
		}
	}
	
	private var buttonsSection: some View{
		HStack(spacing: 15){
			Button {
				vm.saveResults()
			} label: {
				ButtonView(text: "Save", color: .green, isSelected: true)
			}
			
			Button {
				vm.isResultViewShown = false
			} label: {
				ButtonView(text: "Discard", color: .red, isSelected: true)
			}
		}
		.buttonStyle(.plain)
	}
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
		ResultsView(result: TestResult(timestamp: Date(), wordsPm: 45, charsPm: 230, precision: 89), isResultViewShown: .constant(true))
			.preferredColorScheme(.light)
    }
}
