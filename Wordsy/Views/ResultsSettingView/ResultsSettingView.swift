//
//  HomeSettingView.swift
//  Wordsy
//
//  Created by Federico Imberti on 30/03/22.
//

import SwiftUI

struct ResultsSettingView: View {
	@Binding var isSettingsViewDisplayed:Bool
	
	var body: some View {
		VStack {
			HStack {
				titleSection
				Spacer()
				dismissButtonSection
			}
			.padding()
			
			Spacer()
			
			clearResultsButtonSection
			
			Spacer()
			Spacer()
		}
		.frame(width: 300, height: 200)
	}
}

extension ResultsSettingView {
	private var titleSection: some View{
		Text("Results settings")
			.font(.largeTitle)
			.fontWeight(.medium)
	}
	
	private var dismissButtonSection: some View {
		Button {
			isSettingsViewDisplayed = false
		} label: {
			DismissButtonView()
		}
		.buttonStyle(.plain)
	}
	
	private var clearResultsButtonSection: some View{
		Button {
			PersistanceManager.getShared().deleteAll()
		} label: {
			ButtonView(text: "Clear results", color: .red, isSelected: true, frameWidth: 200)
		}
		.buttonStyle(.plain)
	}
}


struct HomeSettingView_Previews: PreviewProvider {
	static var previews: some View {
		ResultsSettingView(isSettingsViewDisplayed: .constant(true))
			.preferredColorScheme(.light)
	}
}
