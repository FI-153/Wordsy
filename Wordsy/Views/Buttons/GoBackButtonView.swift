//
//  GoBackButton.swift
//  Wordsy
//
//  Created by Federico Imberti on 30/03/22.
//

import SwiftUI

struct GoBackButtonView: View {
	@Binding var usingVariable:Bool
	
	var body: some View {
		Button {
			usingVariable = false
		} label: {
			ButtonView(text: "Home", color: .bgYellow, isSelected: true)
		}
		.buttonStyle(.plain)

	}
}

struct GoBackButtonVie_Previews: PreviewProvider {
	static var previews: some View {
		GoBackButtonView(usingVariable: .constant(true))
	}
}
