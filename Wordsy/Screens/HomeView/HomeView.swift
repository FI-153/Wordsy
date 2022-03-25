//
//  HomeView.swift
//  Wordsy
//
//  Created by Federico Imberti on 25/03/22.
//

import SwiftUI

struct HomeView: View {
	@State private var isOneMinuteTestDisplayed = false
	@State private var areStatisticsShown = false
	
	var body: some View {
		ZStack {
			BackgroundView()
			
			if isOneMinuteTestDisplayed {
				WordView()
			} else if areStatisticsShown {
				
			} else {
				VStack{
					ZStack{
						Circle()
							.fill(Color.bgYellow)
						
						Image("")
					}
					.frame(width: 150, height: 150)
					
					Text("Hello there!")
						.font(.system(size: 30, weight: .medium))
					
					Group {
						Button {
							isOneMinuteTestDisplayed = true
						} label: {
							ButtonView(text: "One Minute Test", color: .bgYellow, isSelected: true, frameWidth: 250)
						}
						
						Button {
							
						} label: {
							ButtonView(text: "Statistics", color: .bgYellow, isSelected: true, frameWidth: 250)
						}
					}
					.buttonStyle(.plain)
					
				}
			}
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.preferredColorScheme(.light)
			.frame(width: 1000, height: 700)
    }
}
