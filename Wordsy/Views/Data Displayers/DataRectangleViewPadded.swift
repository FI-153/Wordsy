//
//  DataRectangleViewPadded.swift
//  Wordsy
//
//  Created by Federico Imberti on 23/03/22.
//

import SwiftUI

struct DataRectangleViewPadded: View {
	
	var value:Int
	var information:String
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 15)
				.fill(Color.bgYellow)
			
			DataRectangleView(value: .constant(value), information: information)
		}
		.frame(width: 110, height: 110)
    }
}

struct DataRectangleViewPadded_Previews: PreviewProvider {
    static var previews: some View {
		HStack {
			DataRectangleViewPadded(value: 32, information: "Words/min")
			DataRectangleViewPadded(value: 120, information: "Chars/min")
			DataRectangleViewPadded(value: 94, information: "% acccuracy")
		}
		
	}
}
