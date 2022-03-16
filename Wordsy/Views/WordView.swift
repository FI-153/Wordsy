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
		VStack(alignment: .center){
			
			HStack{
								
				Text(vm.currentWord)
					.font(.largeTitle)
				
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
