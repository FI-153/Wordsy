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
			
			HStack{
				
				HStack{
					ForEach(vm.typedWords, id: \.self) { word in
						Text(word)
					}
				}
				.fixedSize(horizontal: true, vertical: false)
				.frame(width: 250, alignment: .trailing)
				
				Text(vm.currentWord)
					.font(.largeTitle)
				
				HStack{
					ForEach(vm.nextWords, id: \.self) { word in
						Text(word)
					}
				}
				.fixedSize(horizontal: true, vertical: false)
				.frame(width: 250, alignment: .leading)

			}
			
			Button {
				
			} label: {
				Text("Next Word")
					.font(.title2)
			}
			.buttonStyle(.bordered)
			.tint(.green)

		}
		.frame(width: 700, height: 500, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
