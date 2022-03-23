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
		ZStack {
			BackgroundView()
			
			VStack{
				
				Spacer()
				
				HStack(spacing: 15){
					
					SecondsView(value: $vm.timerValue)
						.onReceive(vm.timerManager.timer) { time in
							vm.timerValueMinusOne()
						}
						.padding(.trailing, 40)
					
					DataRectangleView(value: $vm.wordsPerMinute, information: "Words/min")
					DataRectangleView(value: $vm.charsPerMinute, information: "Chars/min")
					DataRectangleView(value: $vm.precision, information: "% acccuracy")
					
				}
				
				Group{
					HStack{
						typedWordSection
						currentWordSection
						nextWordSection
					}
					.font(.title2)
					.frame(height: 80)
					.frame(maxWidth: .infinity)
					.background(Color.white)
				}
				.offset(y: 40)
				
				Spacer()
					
				SettingView()

				Spacer()
				
			}
		}
		.frame(width: 1000, height: 700, alignment: .center)
	}
}

extension WordView {
	private var typedWordSection: some View {
		HStack{
			ForEach(vm.typedWords) { word in
				if word.wasTypedCorrecly {
					Text(word.value)
						.foregroundColor(.green.opacity(0.7))
				} else {
					Text(word.value)
						.foregroundColor(.red.opacity(0.7))
						.strikethrough()
				}
			}
		}
		.fixedSize(horizontal: true, vertical: false)
		.frame(width: 250, alignment: .trailing)
	}
	
	private var currentWordSection: some View{
		ZStack {
			Text(vm.currentWord.value.appending(" "))
				.foregroundColor(.secondary)

			TextField("", text: $vm.typedWord)
				.textFieldStyle(.plain)
				.onSubmit {
					
					vm.startTimerIfNoneAreActive()
					
					if vm.isTypedWordCorrect() {
						vm.registerCorrectWord()
					} else {
						vm.registerWrongWord()
					}
				}
				.onChange(of: vm.typedWord) { wordBeingTyped in
					
					vm.startTimerIfNoneAreActive()
					
					if wordBeingTyped == vm.currentWord.value.appending(" ") {
						vm.registerCorrectWord()
					}
				}
		}
		.font(.largeTitle)
		.frame(maxWidth: .infinity)
		.fixedSize(horizontal: true, vertical: true)
	}
	
	private var nextWordSection: some View{
		HStack{
			ForEach(vm.nextWords, id: \.self) { word in
				Text(word.value)
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
