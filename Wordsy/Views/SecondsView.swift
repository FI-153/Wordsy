//
//  DataView.swift
//  Wordsy
//
//  Created by Federico Imberti on 17/03/22.
//

import SwiftUI

struct SecondsView: View {
	
	@Binding var value:Int

    var body: some View {
		ZStack{
			Circle()
				.fill(Color.white)
			
			VStack{
				Text("\(value)")
					.font(.system(size: 40, weight: .semibold, design: .default))
					.foregroundColor(getNumberColor())

				Text("Seconds")
					.font(.system(size: 15, weight: .light, design: .default))
					.foregroundColor(.black)
					.italic()
			}
		}
		.frame(width: 100, height: 100)
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
				SecondsView(value: .constant(60))

				SecondsView(value: .constant(60))
					.preferredColorScheme(.dark)
			}

			HStack{
				SecondsView(value: .constant(10))

				SecondsView(value: .constant(10))
					.preferredColorScheme(.dark)
			}

			HStack{
				SecondsView(value: .constant(3))

				SecondsView(value: .constant(3))
					.preferredColorScheme(.dark)
			}

		}
    }
}
