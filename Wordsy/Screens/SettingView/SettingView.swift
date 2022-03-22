//
//  SettingView.swift
//  Wordsy
//
//  Created by Federico Imberti on 22/03/22.
//

import SwiftUI

struct SettingView: View {
	var body: some View {
		RoundedRectangle(cornerRadius: 15)
			.fill(Material.thinMaterial)
			.frame(width: 300, height: 250)
			.overlay {
				VStack {
					
					Text("Difficulty")
						.font(.title)
						.fontWeight(.semibold)
					
					Button {
						
					} label: {
						ButtonView(text: "Easy", color: .green, isSelected: true)
					}
					.buttonStyle(.plain)
					
					Button {
						
					} label: {
						ButtonView(text: "Medium", color: .orange, isSelected: false)
					}
					.buttonStyle(.plain)
					
					Button {
						
					} label: {
						ButtonView(text: "Hard", color: .red, isSelected: false)
					}
					.buttonStyle(.plain)
				}
			}
	}
}

struct SettingView_Previews: PreviewProvider {
	static var previews: some View {
		SettingView()
			.frame(width: 500, height: 500)
			.preferredColorScheme(.light)
	}
}
