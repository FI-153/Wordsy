//
//  ButtonView.swift
//  Wordsy
//
//  Created by Federico Imberti on 22/03/22.
//

import SwiftUI

struct ButtonView: View {
	var text:String
	var color:Color
	var isSelected:Bool
	var frameWidth:CGFloat? = 150
	
    var body: some View {
        Text(text)
			.foregroundColor(.white)
			.font(.title)
			.fontWeight(.medium)
			.shadow(radius: 15)
			.padding()
			.frame(width: frameWidth, height: 50)
			.background(color.opacity(0.5))
			.clipShape(RoundedRectangle(cornerRadius: 15))
			.shadow(radius: 1)
			.opacity(isSelected ? 1 : 0.6)
    }
}

struct ButtonView_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			ButtonView(text: "Easy", color: .green, isSelected: false)
			ButtonView(text: "Medium", color: .orange, isSelected: true)
			ButtonView(text: "Hard", color: .red, isSelected: false)
		}
		.frame(width: 300, height: 300)
		.preferredColorScheme(.light)
	}
}
