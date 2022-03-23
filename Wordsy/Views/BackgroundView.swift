//
//  BackgroundView.swift
//  Wordsy
//
//  Created by Federico Imberti on 23/03/22.
//

import SwiftUI

struct BackgroundView: View {
	var body: some View {
		VStack{
			Spacer()
			
			HStack(spacing: -250) {
				Ellipse()
					.fill(Color.bgYellow)
					.frame(width: 903, height: 80)
					.offset(y: 20)
				
				Ellipse()
					.fill(Color.bgYellow)
					.frame(width: 903, height: 60)
					.offset(y: 20)
				
				Ellipse()
					.fill(Color.bgYellow)
					.frame(width: 953, height: 43)
					.offset(y: 25)
			}
			.shadow(radius: 15)
		}
		.frame(width: 1000, height: 700)
	}
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
			.preferredColorScheme(.light)
    }
}
