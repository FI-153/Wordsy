//
//  DataRectangleView.swift
//  Wordsy
//
//  Created by Federico Imberti on 18/03/22.
//

import SwiftUI

struct DataRectangleView: View {
	
	@State private var vm:DataRectangleViewModel
	
	init(value:Int, information:String) {
		_vm = .init(wrappedValue: DataRectangleViewModel(value: value, information: information))
	}
	
	var body: some View {
			ZStack{
				RoundedRectangle(cornerRadius: 15)
					.fill(Color.white)
				
				VStack{
					Text("\(vm.getValue())")
						.font(.system(size: 40, weight: .semibold, design: .default))
						.foregroundColor(.black)
					
					Text("\(vm.getInformation())")
						.font(.system(size: 15, weight: .light, design: .default))
						.foregroundColor(.black)
						.italic()
				}
			}
			.frame(width: 100, height: 100)
			
	}
}

class DataRectangleViewModel: ObservableObject {
	@Published var value:Int
	@Published var information:String
	
	init(value:Int, information:String){
		self.value = value
		self.information = information
	}
	
	func getValue() -> Int {
		self.value
	}
	
	func getInformation() -> String {
		self.information
	}
}

struct DataRectangleView_Previews: PreviewProvider {
    static var previews: some View {
		HStack {
			DataRectangleView(value: 32, information: "Words/min")
			DataRectangleView(value: 120, information: "Chars/min")
			DataRectangleView(value: 94, information: "% acccuracy")
		}
    }
}
