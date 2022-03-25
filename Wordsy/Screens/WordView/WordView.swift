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
			
			Group {
				BackgroundView()
				
				VStack{
					
					Spacer()
					
					HStack(spacing: 15){
						
						SecondsView(value: $vm.timerValue)
							.onReceive(vm.timerManager.timer) { timeElapsed in
								
								if vm.timerValue == 0 {
									vm.stopTimer()
									vm.registerResults()
								} else {
									vm.timerValueMinusOne()
								}
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
					
					SettingView(difficulty: $vm.difficulty)
						.disabled(vm.timerManager.timerIsRunning)
						.opacity(vm.timerManager.timerIsRunning ? 0.8 : 1)
						.animation(.easeOut, value: vm.timerManager.timerIsRunning)
					
					Spacer()
					
				}
			}
			.blur(radius: vm.result == nil ? 0 : 15)
			
			if vm.isResultViewShown {
				if let result = vm.result {
					ZStack {
						RoundedRectangle(cornerRadius: 15)
							.fill(Material.thin)
						
						ResultsView(result: result, isResultViewShown: $vm.isResultViewShown)
					}
					.onDisappear{
						vm.reset()
					}
				} else {
					Text("Unable to load results...")
						.font(.largeTitle)
						.foregroundColor(.red)
				}
			}
			
		}
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
			
			Group {
				if vm.difficulty == .hard {
					SecureField("", text: $vm.typedWord)
				} else {
					TextField("", text: $vm.typedWord)
				}
			}
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
				
				if vm.difficulty == .medium || vm.difficulty == .hard {
					Text(word.value.toDots())
						.foregroundColor(.black)
				} else {
					Text(word.value)
						.foregroundColor(.black)
				}
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
