//
//  SwiftUIView.swift
//  Wordsy
//
//  Created by Federico Imberti on 05/04/22.
//

import SwiftUI

struct ResultView: View {
	var timestamp:Date
	var wordsPm:Int16
	var charsPm:Int16
	var precision:Int16

    var body: some View {
		ZStack {
			Color.white
			
			HStack{
				VStack{
					Text("\(timestamp.formatted())")
						.font(.title2)
						.fontWeight(.medium)
					
					Spacer()
				}
				.padding()
				
				Group {
					DataRectangleViewPadded(value: Int(wordsPm), information: "Words/min")
					DataRectangleViewPadded(value: Int(charsPm), information: "Chars/min")
					DataRectangleViewPadded(value: Int(precision), information: "Precision")
				}
				.scaleEffect(0.8)
			}
		}
		.frame(width: 550, height: 100, alignment: .center)
		.clipShape(RoundedRectangle(cornerRadius: 25))
		.shadow(radius: 5)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color.white
			
			ResultView(timestamp: Date.now, wordsPm: 45, charsPm: 153, precision: 69)
				.preferredColorScheme(.light)
		}
    }
}
