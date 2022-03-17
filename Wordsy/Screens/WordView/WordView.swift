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
			
			HStack{
				SecondsView(value: 60)
			}
			
			Group{
				HStack{
					typedWordSection
					currentWordSection
					nextWordSection
				}
				
				//ONLY FOR DEVELOPMENT PURPOSES
				Button {
					vm.correctWord()
				} label: {
					Text("Next Word")
						.font(.title2)
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
			}
		}
		.fixedSize(horizontal: true, vertical: false)
		.frame(width: 250, alignment: .trailing)
	}
	
	private var currentWordSection: some View{
		Text(vm.currentWord)
			.font(.largeTitle)
	}
	
	private var nextWordSection: some View{
		HStack{
			ForEach(vm.nextWords, id: \.self) { word in
				Text(word)
			}
		}
		.fixedSize(horizontal: true, vertical: false)
		.frame(width: 250, alignment: .leading)
		
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		WordView()
	}
}
