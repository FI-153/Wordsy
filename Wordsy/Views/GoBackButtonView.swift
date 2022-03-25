//
//  GoBackButtonView.swift
//  Wordsy
//
//  Created by Federico Imberti on 25/03/22.
//

import SwiftUI

struct GoBackButtonView: View {
    var body: some View {
		ZStack {
			Color.bgYellow.opacity(0.8)
			
			HStack {
				Group {
					Image(systemName: "arrow.left.circle")
						.font(.system(size: 30, weight: .medium))
						
					Text("Go Back")
						.fontWeight(.medium)
				}
				.font(.title)
			}
		}
		.foregroundColor(.white)
		.frame(width: 180, height: 60)
		.clipShape(Capsule())
    }
}

struct GoBackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GoBackButtonView()
    }
}
