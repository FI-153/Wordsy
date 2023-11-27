//
//  ContentView.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import SwiftUI

struct OneMinuteTestView: View {
	
	@StateObject var vm:OneMinuteTestViewModel
	
	init(isOneMinuteTestDisplayed:Binding<Bool>){
		self._vm = .init(wrappedValue: OneMinuteTestViewModel(isOneMinuteTestDisplayed: isOneMinuteTestDisplayed))
	}
	
	var body: some View {
		ZStack {
			
			Group {
				headerSection
				
				VStack{
					
					Spacer()
					
					statisticsView
					
					Group{
						HStack{
							typedWordSection
							currentWordSection
							nextWordSection
						}
						.modifier(TypingViewModifiers())
					}
					.offset(y: 40)
					
					Spacer()
					
					DifficultySettingView(difficulty: $vm.difficulty)
						.disabled(vm.timerManager.timerIsRunning)
						.opacity(vm.timerManager.timerIsRunning ? 0.8 : 1)
						.animation(.easeOut, value: vm.timerManager.timerIsRunning)
					
					Spacer()
					
				}
			}
			.blur(radius: vm.result == nil ? 0 : 15)
			
			if vm.isResultViewShown {
				if let result = vm.result {
					showResults(for: result)
				} else {
					Text("Unable to load results...")
						.font(.largeTitle)
						.foregroundColor(.red)
				}
			}
			
		}
	}
}

struct TypingViewModifiers: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title2)
			.frame(height: 80)
			.frame(maxWidth: .infinity)
			.background(Color.white)
	}
}

extension OneMinuteTestView {
	private var typedWordSection: some View {
		HStack{
			ForEach(vm.wordManager.typedWords) { word in
				Text(word.getValue())
					.foregroundColor(word.getWasTypedCorrectly() ? .green.opacity(0.7) : .red.opacity(0.7))
					.strikethrough(!word.getWasTypedCorrectly())
			}
		}
		.fixedSize(horizontal: true, vertical: false)
		.frame(width: 250, alignment: .trailing)
	}
	
	private var currentWordSection: some View{
		ZStack {
			Text(vm.wordManager.currentWord.getValue().appending(" "))
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
			}
			.onChange(of: vm.typedWord) { wordBeingTyped in
				vm.checkSpelling(of: wordBeingTyped)
			}
			
		}
		.font(.largeTitle)
		.frame(maxWidth: .infinity)
		.fixedSize(horizontal: true, vertical: true)
	}
	
	private var nextWordSection: some View{
		HStack{
			ForEach(vm.wordManager.nextWords) { word in
				
				if vm.difficulty == .medium || vm.difficulty == .hard {
					Text(word.getValue().toDots())
				} else {
					Text(word.getValue())
				}
			}
		}
		.foregroundColor(.primary)
		.fixedSize(horizontal: true, vertical: false)
		.frame(width: 250, alignment: .leading)
		
	}
	
	private var headerSection: some View{
		VStack {
			HStack{
				GoBackButtonView(usingVariable: $vm.isOneMinuteTestDisplayed)
				Spacer()
			}
			Spacer()
		}
		.padding()
	}
	
	private var statisticsView: some View{
		HStack(spacing: 15){
			
			SecondsView(value: $vm.timerValue)
				.onReceive(vm.timerManager.timer) { _ in
					vm.updateTimer()
				}
				.padding(.trailing, 40)
			
			DataRectangleView(value: $vm.wordsPerMinute, information: "Words/min")
			DataRectangleView(value: $vm.charsPerMinute, information: "Chars/min")
			DataRectangleView(value: $vm.precision, information: "% acccuracy")
			
		}
	}
	
	private func showResults(for result:TestResult) -> some View{
		ZStack {
			RoundedRectangle(cornerRadius: 15)
				.fill(Material.thin)
			
			ResultsView(result: result, isResultViewShown: $vm.isResultViewShown)
		}
		.onDisappear{
			vm.reset()
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		OneMinuteTestView(isOneMinuteTestDisplayed: .constant(false))
			.frame(width: 1000, height: 700)
			.preferredColorScheme(.light)
	}
}
