//
//  ContentView.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import SwiftUI

struct WordView: View {
	
	@StateObject var vm = WordViewModel()
	
	var body: some View {
		VStack{
			
			Spacer()
			
			HStack(spacing: 15){
				Spacer()
				SecondsView(value: $vm.timerValue)
				//Fix the temporary timer
					.onReceive(vm.timer) { time in
						vm.timerValueMinusOne()
					}
				
				Spacer()
				
				DataRectangleView(value: 32, information: "Words/min")
				DataRectangleView(value: 120, information: "Chars/min")
				DataRectangleView(value: 94, information: "% acccuracy")
				
				Spacer()
			}
			
			Group{
				HStack{
					typedWordSection
					currentWordSection
					nextWordSection
				}
				.font(.title2)
				.frame(height: 60)
				.frame(maxWidth: .infinity)
				.background(Color.white)
				
				//ONLY FOR DEVELOPMENT PURPOSES
				Button {
					vm.correctWord()
				} label: {
					Text("Next Word")
				}
				.buttonStyle(.bordered)
				.tint(.green)
				
				Button {
					vm.startTimer()
				} label: {
					Text("Start timer")
				}
				.buttonStyle(.bordered)
				.tint(.green)
				
				Button {
					do {
						try vm.stopTimer()
					} catch let error {
						print(error.localizedDescription)
					}
				} label: {
					Text("Stop timer")
				}
				.buttonStyle(.bordered)
				.tint(.green)

				//
			}
			.offset(y: 40)
			
			Spacer()
			Spacer()
			
		}
		.frame(width: 700, height: 500, alignment: .center)
	}
}

extension WordView {
	private var typedWordSection: some View {
		HStack{
			ForEach(vm.typedWords, id: \.self) { word in
				Text(word)
					.foregroundColor(.black)
			}
		}
		.fixedSize(horizontal: true, vertical: false)
		.frame(width: 250, alignment: .trailing)
	}
	
	private var currentWordSection: some View{
		Text(vm.currentWord)
			.font(.largeTitle)
			.foregroundColor(.secondary)
	}
	
	private var nextWordSection: some View{
		HStack{
			ForEach(vm.nextWords, id: \.self) { word in
				Text(word)
					.foregroundColor(.black)
			}
		}
		.fixedSize(horizontal: true, vertical: false)
		.frame(width: 250, alignment: .leading)
		
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		WordView()
			.preferredColorScheme(.light)
	}
}
