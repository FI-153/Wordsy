//
//  DataRectangleView.swift
//  Wordsy
//
//  Created by Federico Imberti on 18/03/22.
//

import SwiftUI

struct DataRectangleView: View {
	
	@Binding var value:Int
	var information:String

	var body: some View {
			ZStack{
				RoundedRectangle(cornerRadius: 15)
					.fill(Color.white)
				
				VStack{
					Text("\(value)")
						.font(.system(size: 40, weight: .semibold, design: .default))
						.foregroundColor(.black)
					
					Text("\(information)")
						.font(.system(size: 15, weight: .light, design: .default))
						.foregroundColor(.black)
						.italic()
				}
			}
			.frame(width: 100, height: 100)
	}
}

struct DataRectangleView_Previews: PreviewProvider {
    static var previews: some View {
		HStack {
			DataRectangleView(value: .constant(32), information: "Words/min")
			DataRectangleView(value: .constant(120), information: "Chars/min")
			DataRectangleView(value: .constant(94), information: "% acccuracy")
		}
    }
}
