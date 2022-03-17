//
//  DataView.swift
//  Wordsy
//
//  Created by Federico Imberti on 17/03/22.
//

import SwiftUI

struct SecondsView: View {
	
	@StateObject private var vm:SecondsViewModel
	
	init(value:Int) {
		_vm = .init(wrappedValue: SecondsViewModel(value: value))
	}
	
    var body: some View {
		ZStack{
			Circle()
				.fill(Color.white)
			
			VStack{
				Text("\(vm.getValue())")
					.font(.system(size: 40, weight: .semibold, design: .default))
					.foregroundColor(vm.getNumberColor())

				Text("Seconds")
					.font(.system(size: 15, weight: .light, design: .default))
					.foregroundColor(.black)
					.italic()
			}
		}
		.frame(width: 100, height: 100)
    }
	
}

class SecondsViewModel: ObservableObject{
	var value:Int
	
	init(value:Int) {
		self.value = value
	}
	
	func getValue() -> Int {
		value
	}
	
	func getNumberColor() -> Color {
		if value <= 3 {
			return .red
		} else if value <= 10 {
			return .orange
		}
		
		return .black
	}

}

struct SecondsView_Previews: PreviewProvider {
    static var previews: some View {
		
		VStack {
			HStack{
				SecondsView(value: 60)
				
				SecondsView(value: 60)
					.preferredColorScheme(.dark)
			}
			
			HStack{
				SecondsView(value: 10)
				
				SecondsView(value: 10)
					.preferredColorScheme(.dark)
			}
			
			HStack{
				SecondsView(value: 3)
				
				SecondsView(value: 3)
					.preferredColorScheme(.dark)
			}

		}
    }
}
