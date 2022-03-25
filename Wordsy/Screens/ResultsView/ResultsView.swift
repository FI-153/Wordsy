//
//  ResultsView.swift
//  Wordsy
//
//  Created by Federico Imberti on 23/03/22.
//

import SwiftUI

struct ResultsView: View {
	var result:TestResult
	@Binding var isResultViewShown:Bool
	
	var persistanceManager = PersistanceManager.getShared()
	
    var body: some View {
		VStack {
			Spacer()
			
			Text("Great job!")
				.font(.system(size: 30, weight: .medium))
			
			Spacer()
			
			HStack(spacing: 15){
				DataRectangleViewPadded(value: result.wordsPm, information: "Words/min")
				DataRectangleViewPadded(value: result.charsPm, information: "Chars/min")
				DataRectangleViewPadded(value: result.precision, information: "% acccuracy")
			}
			
			Spacer()
			
			HStack(spacing: 15){
				Button {
					persistanceManager.add(result)
					isResultViewShown = false
				} label: {
					ButtonView(text: "Save", color: .green, isSelected: true)
				}
				
				Button {
					isResultViewShown = false
				} label: {
					ButtonView(text: "Discard", color: .red, isSelected: true)
				}
			}
			.buttonStyle(.plain)
			
			Spacer()
		}
		.frame(width: 600, height: 400)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
		ResultsView(result: TestResult(timestamp: Date(), wordsPm: 45, charsPm: 230, precision: 89), isResultViewShown: .constant(true))
			.preferredColorScheme(.light)
    }
}
