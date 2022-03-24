//
//  SettingView.swift
//  Wordsy
//
//  Created by Federico Imberti on 22/03/22.
//

import SwiftUI

struct SettingView: View {
	@Binding var difficulty:WordsyDifficulty
	
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
						difficulty = .easy
					} label: {
						ButtonView(text: "Easy", color: .green, isSelected: difficulty == .easy)
					}
					.buttonStyle(.plain)
					
					Button {
						difficulty = .medium
					} label: {
						ButtonView(text: "Medium", color: .orange, isSelected: difficulty == .medium)
					}
					.buttonStyle(.plain)
					
					Button {
						difficulty = .hard
					} label: {
						ButtonView(text: "Hard", color: .red, isSelected: difficulty == .hard)
					}
					.buttonStyle(.plain)
				}
			}
	}
}

struct SettingView_Previews: PreviewProvider {
	static var previews: some View {
		SettingView(difficulty: .constant(WordsyDifficulty.medium))
			.frame(width: 500, height: 500)
			.preferredColorScheme(.light)
	}
}
